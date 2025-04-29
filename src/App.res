@react.component
let make = () => {
  let route = Route.useRoute()
  let {settings} = Store.Settings.use()

  React.useEffect0(() => {
    settings.theme->Util.Dom.setTheme
    None
  })

  <div className="drawer h-screen">
    <input id="drawer" type_="checkbox" className="drawer-toggle" />
    <div className="drawer-content flex flex-col min-h-0 h-full">
      <Toast.Toaster />
      {switch route {
      | Home => <Home />
      | Clips => <Clips />
      | Stringman => <Stringman />
      | ErrorPage => <ErrorPage />
      }}
    </div>
    <div className="drawer-side z-20">
      <label htmlFor="drawer" ariaLabel="close-sidebar" className="drawer-overlay" />
      <div className="flex flex-col p-2 gap-2 bg-accent">
        <ThemeList />
      </div>
    </div>
  </div>
}
