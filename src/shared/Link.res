type location'

external new: string => location' = "%identity"
external toString: location' => string = "%identity"

let home = new("/")
let clips = new("/clips")

let push: location' => unit = location => location->toString->RescriptReactRouter.push

@react.component
let make = (~to, ~onClick=?, ~className=?, ~children) => {
  let handleClick = evt => {
    evt->ReactEvent.Mouse.preventDefault
    switch onClick {
    | Some(fn) => fn(evt)
    | None => ()
    }
    to->push
  }
  <a href={to->toString} ?className onClick=handleClick> {children} </a>
}
