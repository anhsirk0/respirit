@react.component
let make = () => {
  let (query, setQuery) = React.useState(_ => "")
  let (isEditing, toggleEditing, _) = Hook.useToggle()

  let onChange = evt => {
    let target = ReactEvent.Form.target(evt)
    let newQuery: string = target["value"]
    setQuery(_ => newQuery)
  }

  let store = Store.Searcher.use()
  let isAllChecked = store.engines->Array.every(e => store.checkedIds->Array.includes(e.id))
  let toggleAll = _ => store.toggleAll(isAllChecked)
  let count = store.engines->Array.filter(e => store.checkedIds->Array.includes(e.id))->Array.length

  let onSubmit = evt => {
    ReactEvent.Form.preventDefault(evt)
    // let q = ReactEvent.Form.target(evt)["query"]["value"]

    store.engines
    ->Array.filter(e => store.checkedIds->Array.includes(e.id))
    ->Array.forEach(e => Util.searchLink(e.url, query))
  }

  let clearText = _ => {
    setQuery(_ => "")
    "input[name='query']"->Util.Dom.querySelectAndThen(Util.Dom.focus)
  }

  let items = store.engines->Array.map(item => <SearcherCard key=item.title item query isEditing />)

  <Layout>
    <Navbar title="Searcher">
      <button
        onClick={_ => toggleEditing()}
        className={`btn btn-square btn-accent ${isEditing ? "" : "btn-ghost"}`}>
        <Icon.scribble className="size-6" />
      </button>
    </Navbar>
    <div className="flex flex-col items-center w-full">
      <form
        onSubmit
        className="center h-[20vh] p-4 w-full max-w-xl xl:wax-w-4xl 2xl:max-w-5xl shrink-0 z-[5]">
        <div id="searcher" className="center h-10 2xl:h-12 w-16 gap-2 rounded-l-field bg-base-300">
          <Checkbox checked=isAllChecked onChange=toggleAll />
          {count > 0
            ? <p className="text-lg text-primary"> {count->Int.toString->React.string} </p>
            : React.null}
        </div>
        <label
          id="search-input"
          className="input border-none has-[:focus]:outline-none bg-base-300 2xl:input-lg flex items-center join-item grow rounded-none">
          <InputBase
            required=true name="query" className="grow" value=query onChange placeholder="Search"
          />
          {query->String.length > 0
            ? <button
                onClick=clearText
                type_="button"
                className="btn btn-sm btn-ghost btn-circle text-base-content/60">
                <Icon.x />
              </button>
            : React.null}
        </label>
        <button
          id="search-btn"
          className="btn btn-ghost bg-base-300 2xl:btn-lg join-item no-animation rounded-l-none">
          <Icon.magnifyingGlass className="r-icon" />
        </button>
      </form>
      <div className="center px-4 2xl:py-4 join 2xl:max-w-7xl z-[5] w-full">
        <div className="grid grid-cols-12 gap-4 xl:gap-8 w-full"> {React.array(items)} </div>
        <AddSearcherButton />
      </div>
    </div>
  </Layout>
}
