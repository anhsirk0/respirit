type t =
  | Home
  | Clips
  | Stringman
  | Searcher
  | ErrorPage

let useRoute: unit => t = () => {
  let url = RescriptReactRouter.useUrl()

  switch url.path {
  | list{} => Home
  | list{"clips"} => Clips
  | list{"stringman"} => Stringman
  | list{"searcher"} => Searcher
  | _ => ErrorPage
  }
}
