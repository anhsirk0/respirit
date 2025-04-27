module Clip = {
  type id = float
  type t = {
    id: id,
    content: string,
    createdAt: float,
    updatedAt: float,
  }

  let make = () => {
    let date = Date.now()
    {
      id: date,
      content: "",
      createdAt: date,
      updatedAt: date,
    }
  }

  let defaultClips = [
    {
      id: 0.,
      content: "Welcome to Clips",
      createdAt: Date.now(),
      updatedAt: Date.now(),
    },
  ]
}
