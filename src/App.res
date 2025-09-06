@react.component
let make = () => {
  let route = Route.useRoute()
  let {settings} = Store.Settings.use()

  React.useEffect0(() => {
    settings.theme->Util.Dom.setTheme
    None
  })

  switch route {
  | Home => <Home />
  | Clips => <Clips />
  | Stringman => <Stringman />
  | Searcher => <Searcher />
  | ErrorPage => <ErrorPage />
  }
}
