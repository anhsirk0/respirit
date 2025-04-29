@react.component
let make = (~title, ~children=React.null) => {
  <div
    className="w-full h-12 md:h-full md:w-16 box-primary p-4 flex flex-row-reverse md:flex-col md:justify-center items-center z-10 relative">
    {children}
    <label
      htmlFor="drawer"
      ariaLabel="select-theme"
      tabIndex=0
      className="btn btn-ghost btn-square btn-primary">
      <Icon.palette className="size-6" />
    </label>
    <div className="grow" />
    <div className="relative font-black">
      <p className="md:hidden text-3xl"> {title->React.string} </p>
      <p className="text-4xl absolute top-0 -left-6 hidden md:block -rotate-90 origin-top-left">
        {title->React.string}
      </p>
    </div>
  </div>
}
