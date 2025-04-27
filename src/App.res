@react.component
let make = () => {
  let route = Route.useRoute()
  let {settings} = Store.Settings.use()

  React.useEffect0(() => {
    settings.theme->Util.Dom.setTheme
    None
  })

  <React.Fragment>
    <Toast.Toaster />
    {switch route {
    | Home => <Home />
    | Clips => <Clips />
    | ErrorPage => <ErrorPage />
    }}
  </React.Fragment>
}
