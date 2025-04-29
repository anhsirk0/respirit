module Item = {
  @react.component
  let make = (~value, ~op: Shape.Stringman.t) => {
    let text = value->Util.Str.or(op.title)->op.fn

    let onClick = _ => {
      text->Util.Dom.copyText
      Toast.success("Copied to clipboard")
    }

    <div
      onClick
      tabIndex=0
      className="col-span-12 md:col-span-6 lg:col-span-4 xl:col-span-3 p-4 flex flex-col gap-2 border border-main rounded-box cursor-pointer bg-base-100 hover:bg-primary/5 active:bg-primary/10 transit active:scale-105">
      <p className="text-80 text-sm"> {op.title->React.string} </p>
      <p className="text-xl line-clamp-5"> {text->React.string} </p>
    </div>
  }
}

@react.component
let make = () => {
  let (value, setValue) = React.useState(_ => "")
  let onChange = evt => {
    let target = ReactEvent.Form.target(evt)
    setValue(_ => target["value"])
  }

  let clearText = _ => {
    setValue(_ => "")
    "input[name='query']"->Util.Dom.querySelectAndThen(Util.Dom.focus)
  }

  <Layout>
    <Navbar title="Stringman" />
    <div
      className="grid grid-cols-12 gap-4 xl:gap-8 p-4 size-full max-w-7xl mx-auto overflow-y-auto min-h-0 pb-8">
      <div className="col-span-12 center flex-col">
        <div className="text-5xl 2xl:text-7xl font-black text-primary mb-8">
          {"Stringman"->React.string}
        </div>
        <label
          className="input has-[:focus]:outline-none input-xl flex items-center w-full has-[:focus]:border-primary">
          <input
            name="query" value onChange className="grow" autoComplete="off" placeholder="String"
          />
          {value->String.length > 0
            ? <button onClick=clearText className="btn btn-ghost btn-circle">
                <Icon.x className="size-6" />
              </button>
            : React.null}
        </label>
      </div>
      {Shape.Stringman.ops->Array.map(op => <Item op value />)->React.array}
    </div>
  </Layout>
}
