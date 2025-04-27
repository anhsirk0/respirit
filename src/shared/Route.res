type t =
  | Home
  | Clips
  | ErrorPage

let useRoute: unit => t = () => {
  let url = RescriptReactRouter.useUrl()

  switch url.path {
  | list{} => Home
  | list{"clips"} => Clips
  | _ => ErrorPage
  }
}
