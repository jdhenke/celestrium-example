$ () ->

  celestrium.init
    "DependencyProvider": {}
    "KeyListener":
      document.querySelector "body"
    "GraphModel":
      nodeHash: (node) -> node.text
      linkHash: (link) -> link.source.text + link.target.text
    "GraphView": {
      el: document.querySelector "body"
    }
    "NodeSelection": {}
    "Sliders":
      el: document.querySelector "#sliders"
    "ForceSliders": {}
    "LinkDistribution":
      "el": document.querySelector "#distro"

  , (instances) ->
    needs = (a, b) ->
      A = celestrium.defs[a.text]
      output =  A.needs? and b.text in _.values(A.needs)
      return output
    for uri, instance of instances
      instances["GraphModel"].putNode
        text: uri
    nodes = instances["GraphModel"].getNodes()
    _.each nodes, (node1) =>
      _.each nodes, (node2) =>
        if needs(node1, node2)
          instances["GraphModel"].putLink {source: node1, target: node2, strength: 0.8, direction: "forward"}
