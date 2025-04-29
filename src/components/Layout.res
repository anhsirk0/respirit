@react.component
let make = (~children) => {
  <div className="drawer h-screen size-full">
    <input id="drawer" type_="checkbox" className="drawer-toggle" />
    <div className="flex flex-col md:flex-row h-full w-screen min-h-0">
      <Toast.Toaster />
      {children}
    </div>
    <div className="drawer-side z-20">
      <label htmlFor="drawer" ariaLabel="close-sidebar" className="drawer-overlay" />
      <div className="flex flex-col p-2 gap-2 bg-accent">
        <ThemeList />
      </div>
    </div>
  </div>
}
