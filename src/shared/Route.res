type t =
  | Home
  | Clips
  | Stringman
  | ErrorPage

let useRoute: unit => t = () => {
  let url = RescriptReactRouter.useUrl()

  switch url.path {
  | list{} => Home
  | list{"clips"} => Clips
  | list{"stringman"} => Stringman
  | _ => ErrorPage
  }
}
