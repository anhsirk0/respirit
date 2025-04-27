@react.component
let make = (~clip: Shape.Clip.t, ~idx, ~editMode) => {
  let {updateClip, deleteClip} = Store.Clips.use()
  let (isEditing, toggleEditing, _) = Hook.useToggle(~init=clip.content->Util.Str.isEmpty)
  let (value, setValue) = React.useState(_ => clip.content)
  let (isDebounced, setIsDebounced) = React.useState(_ => true)

  let onChange = evt => {
    setValue(_ => Util.Dom.targetValue(evt))
    if isDebounced {
      setIsDebounced(_ => false)
      let _ = setTimeout(_ => setIsDebounced(_ => true), 800)
    }
  }

  let onBlur = _ => toggleEditing()
  let onDelete = _ => deleteClip(clip.id)
  let onCopy = _ => {
    if value->Util.Str.isEmpty {
      Toast.error("No content to copy")
    } else {
      value->Util.Dom.copyText
      Toast.success("Copied to clipboard")
    }
  }

  React.useEffect(() => {
    if value != clip.content && isDebounced {
      updateClip({...clip, content: value, updatedAt: Date.now()})
    }
    None
  }, [isDebounced])

  <div className="w-full flex h-10 items-end">
    <div className="flex gap-2 z-10 relative isolate pr-2">
      <div className="h-2 w-full bg1 absolute -bottom-2" />
      <div
        role="button"
        onClick=onCopy
        className="w-10 h-8 border border-base-content border-l-8 center font-bold z-10 cursor-pointer">
        {(idx + 1)->Int.toString->React.string}
      </div>
      {editMode
        ? <button onClick=onDelete className="btn btn-error btn-sm btn-square">
            <Icon.trash className="size-4" />
          </button>
        : React.null}
    </div>
    {isEditing
      ? <input
          value
          onChange
          className="text-xl bg1 size-full border-b border-base-content focus:border-b-accent focus:outline-none"
          onBlur
          autoFocus=true
        />
      : <div
          onClick={_ => toggleEditing()}
          className="h-full truncate grow border-b border-base-content/50">
          <p className="text-2xl mt-1"> {value->React.string} </p>
        </div>}
  </div>
}
