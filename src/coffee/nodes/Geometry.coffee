class nodes.types.Geometry.CubeGeometry extends NodeBase
  set_fields: =>
    super
    @ob = new THREE.CubeGeometry(100, 100, 100, 1, 1, 1)
    @rack.addFields
      inputs:
        "flip": -1
        "width": 100,
        "height": 100,
        "depth": 100,
        "segments_width": 1,
        "segments_height": 1,
        "segments_depth": 1,
      outputs:
        "out": {type: "Any", val: @ob}
    @cached = @get_cache_array()
  
  get_cache_array: =>
    [@rack.get("width").get(), @rack.get("height").get(), @rack.get("depth").get(), @rack.get("segments_width").get(), @rack.get("segments_height").get(), @rack.get("segments_depth").get(), @rack.get("flip").get()]

  compute: =>
    new_cache = @get_cache_array()
    if flatArraysAreEquals(new_cache, @cached) == false
      @ob = new THREE.CubeGeometry(@rack.get("width").get(), @rack.get("height").get(), @rack.get("depth").get(), @rack.get("segments_width").get(), @rack.get("segments_height").get(), @rack.get("segments_depth").get(), @rack.get("flip").get())
    @apply_fields_to_val(@rack.node_fields.inputs, @ob)
    @rack.get("out", true).set @ob

class nodes.types.Geometry.SphereGeometry extends NodeBase
  set_fields: =>
    super
    @ob = new THREE.SphereGeometry(100, 20, 20)
    
    #@value = 0
    @rack.addFields
      inputs:
        "radius": 100
        "segments_width": 1
        "segments_height": 1
      outputs:
        "out": {type: "Any", val: @ob}
    @cached = @get_cache_array()
  
  get_cache_array: =>
    [@rack.get("radius").get(), @rack.get("segments_width").get(), @rack.get("segments_height").get()]

  compute: =>
    new_cache = @get_cache_array()
    if flatArraysAreEquals(new_cache, @cached) == false
      @ob = new THREE.SphereGeometry(@rack.get("radius").get(), @rack.get("segments_width").get(), @rack.get("segments_height").get())
      @cached = new_cache
    @apply_fields_to_val(@rack.node_fields.inputs, @ob)
    @rack.get("out", true).set @ob
