@react.component
let make = () => {
  let (editMode, toggleEditMode, _) = Hook.useToggle()
  let {clips, addClip} = Store.Clips.use()
  let onClick = _ => addClip(Shape.Clip.make())

  <div className="flex flex-col md:flex-row size-full">
    <div
      className="w-full h-12 md:h-full md:w-16 box-primary p-4 flex flex-row-reverse md:flex-col md:justify-center items-center z-100">
      <button onClick className="btn btn-primary btn-ghost btn-square">
        <Icon.pencil className="size-6" />
      </button>
      <button
        onClick={_ => toggleEditMode()}
        className={`btn btn-square btn-accent ${editMode ? "" : "btn-ghost"}`}>
        <Icon.scribble className="size-6" />
      </button>
      <div className="dropdown dropdown-end md:dropdown-start">
        <label ariaLabel="select-theme" tabIndex=0 className="btn btn-ghost btn-square btn-primary">
          <Icon.palette className="size-6" />
        </label>
        <div
          tabIndex=0
          className="dropdown-content z-10 shadow box-secondary rounded-box menu [&>li>*:hover]:bg-base-100/20 mt-4 md:-mt-31 md:ml-16">
          <div
            className="flex flex-col gap-2 p-2 w-72 h-[90vh] md:h-[96vh] min-h-0 overflow-y-auto">
            <ThemeList />
          </div>
        </div>
      </div>
      <div className="grow" />
      <p className="md:mb-4 text-3xl xl:text-4xl font-black md:-rotate-90">
        {"Clips"->React.string}
      </p>
    </div>
    <div
      className="bg1 rounded-box p-4 flex flex-col gap-4 grow min-h-0 overflow-y-auto relative isolate">
      <span id="clips" />
      {clips
      ->Array.mapWithIndex((clip, idx) => <Clip clip idx editMode key={clip.id->Float.toString} />)
      ->React.array}
    </div>
  </div>
}
