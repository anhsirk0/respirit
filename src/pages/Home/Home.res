@react.component
let make = () => {
  <div className="size-full flex flex-col gap-4 pt-[4rem]">
    <div className="center flex-col size-full min-h-[50vh] xl:min-h-[60vh] gap-4 p-2">
      <p
        className="text-4xl md:text-5xl xl:text-6xl 2xl:text-7xl font-medium font-serif text-primary text-center">
        {"Respirit"->React.string}
      </p>
      <Link to=Link.clips className="btn btn-primary r-btn w-fit mt-2">
        {"Clips"->React.string}
      </Link>
    </div>
    <div className="h-16 shrink-0" />
  </div>
}
