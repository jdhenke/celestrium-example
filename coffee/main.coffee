$ () ->

  celestrium.init
    "DependencyProvider": {}
    "Layout":
      el: document.querySelector "body"
    "KeyListener":
      document.querySelector "body"
    "GraphModel":
      nodeHash: (node) -> node.text
      linkHash: (link) -> link.source.text + link.target.text
    "GraphView": {}
    "NodeSelection": {}
    "Sliders": {}
    "ForceSliders": {}
    "LinkDistribution": {}
    "NodeSearch":
      local: _.keys celestrium.defs

  , (instances) ->
    for uri, instance of instances
      instances["GraphModel"].putNode
        text: uri
