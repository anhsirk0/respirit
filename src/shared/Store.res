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
    }, {name: "reuse-clips"}))

  let use = () => store->Store.use(state => state)
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
    }, {name: "reuse-options"}))

  let use = () => store->Store.use(state => state)
}
