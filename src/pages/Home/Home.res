@react.component
let make = () => {
  let className = "col-span-12 md:col-span-6 lg:col-span-4 xl:col-span-3 p-4 flex gap-2 border border-main rounded-box cursor-pointer hover:bg-primary/5 active:bg-primary/10 active:scale-105 transit h-20 center font-black text-4xl"

  <div className="flex flex-col md:flex-row size-full min-h-0">
    <Navbar title="Respirit" />
    <div
      className="grid grid-cols-12 gap-8 p-4 size-full max-w-7xl mx-auto overflow-y-auto min-h-0 pb-8">
      <div className="col-span-12 center flex-col">
        <div className="text-7xl font-black text-primary mb-8"> {"Respirit"->React.string} </div>
      </div>
      <Link to=Link.clips className>
        <p className="text-center text-accent"> {"Clips"->React.string} </p>
      </Link>
      <Link to=Link.stringman className>
        <p className="text-center text-success"> {"Stringman"->React.string} </p>
      </Link>
    </div>
  </div>
}
