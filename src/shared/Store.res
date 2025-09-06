module Clips = {
  module StoreData = {
    type state = {
      clips: array<Shape.Clip.t>,
      updateClip: Shape.Clip.t => unit,
      addClip: Shape.Clip.t => unit,
      deleteClip: Shape.Clip.id => unit,
    }
  }

  module Store = Zustand.MakeStore(StoreData)
  let store = Store.create(Store.persist(set => {
      clips: Shape.Clip.defaultClips,
      addClip: clip => set(.state => {...state, clips: [clip]->Array.concat(state.clips)}),
      deleteClip: id =>
        set(.state => {...state, clips: state.clips->Array.filter(n => n.id != id)}),
      updateClip: clip =>
        set(.state => {
          ...state,
          clips: state.clips->Array.map(n => n.id == clip.id ? clip : n),
        }),
    }, {name: "respirit-clips"}))

  let use = () => store->Store.use(state => state)
}

module Searcher = {
  module StoreData = {
    type state = {
      checkedIds: array<float>,
      engines: array<Shape.SearchEngine.t>,
      setEngines: array<Shape.SearchEngine.t> => unit,
      addEngine: Shape.SearchEngine.t => unit,
      updateEngine: Shape.SearchEngine.t => unit,
      deleteEngine: float => unit,
      toggleAll: bool => unit,
      toggleOne: (float, bool) => unit,
    }
  }

  module AppStore = Zustand.MakeStore(StoreData)

  let store = AppStore.create(AppStore.persist(set => {
      checkedIds: [0., 1.],
      engines: Shape.SearchEngine.defaultEngines,
      setEngines: engines => set(.state => {...state, engines}),
      addEngine: engine =>
        set(.state => {...state, engines: state.engines->Array.concat([engine])}),
      updateEngine: engine =>
        set(.state => {
          ...state,
          engines: state.engines->Array.map(e => e.id == engine.id ? engine : e),
        }),
      deleteEngine: id =>
        set(.state => {...state, engines: state.engines->Array.filter(e => e.id != id)}),
      toggleOne: (id, exists) =>
        set(.state => {
          ...state,
          checkedIds: exists
            ? state.checkedIds->Array.filter(i => i != id)
            : state.checkedIds->Array.concat([id]),
        }),
      toggleAll: all =>
        set(.state => {...state, checkedIds: all ? [] : state.engines->Array.map(e => e.id)}),
    }, {name: "respirit-searcher"}))

  let use = _ => store->AppStore.use(state => state)
}

module Settings = {
  type t = {theme: string}
  let defaultSettings = {
    theme: "retro",
  }

  module StoreData = {
    type state = {
      settings: t,
      update: t => unit,
    }
  }

  module Store = Zustand.MakeStore(StoreData)
  let store = Store.create(Store.persist(set => {
      settings: defaultSettings,
      update: settings => set(.state => {...state, settings}),
    }, {name: "respirit-options"}))

  let use = () => store->Store.use(state => state)
}
