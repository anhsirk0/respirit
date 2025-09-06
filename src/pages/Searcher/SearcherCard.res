@react.component
let make = (~item: Shape.SearchEngine.t, ~query, ~isEditing) => {
  let store = Store.Searcher.use()
  let checked = store.checkedIds->Array.includes(item.id)
  let toggleOne = _ => store.toggleOne(item.id, checked)
  let onDelete = _ => store.deleteEngine(item.id)

  let onClick = evt => {
    evt->ReactEvent.Mouse.stopPropagation
    if query->String.length > 0 {
      Util.searchLink(item.url, query)
    }
  }

  let opacity = checked ? "bg-primary/20" : "opacity-80"

  <div
    key={item.id->Float.toString}
    className="col-span-12 md:col-span-6 lg:col-span-4 animate-fade rounded-box relative overflow-hidden bg-base-300"
    name="searcher-item">
    <div
      role="button"
      ariaLabel={`search-${item.title}`}
      onClick
      className={`flex flex-col h-full gap-4 p-4 2xl:p-6 ${opacity} cursor-pointer`}>
      <div className="flex flex-row space-between w-full">
        <p className="card-title w-full"> {item.title->React.string} </p>
        <Checkbox checked onChange=toggleOne />
      </div>
      <p className="text-base-content/60 title">
        {item.url->String.replace("https://", "")->React.string}
      </p>
    </div>
    {isEditing ? <EditSearcherButton engine=item /> : React.null}
    {isEditing
      ? <div
          className="center absolute left-0 bottom-0 bg-error text-error-content rounded-tr-box p-1">
          <div className="dropdown dropdown-end dropdown-right">
            <label ariaLabel={`delete-${item.title}`} tabIndex=0>
              <Icon.trash className="r-icon" />
            </label>
            <div
              tabIndex=0
              className="dropdown-content z-[1] card card-compact w-64 xl:w-72 -ml-6 px-2 py-1 shadow bg-error">
              <div className="flex flex-row items-center justify-between p-2">
                <h3 className="text-base xl:text-xl font-bold">
                  {"Are you sure?"->React.string}
                </h3>
                <button type_="button" className="btn btn-neutral r-btn" onClick=onDelete>
                  {"Yes, Delete"->React.string}
                </button>
              </div>
            </div>
          </div>
        </div>
      : React.null}
  </div>
}
