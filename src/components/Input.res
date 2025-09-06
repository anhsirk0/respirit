module FormControl = {
  @react.component
  let make = (~label, ~children) => {
    <div className="fieldset w-full flex-col">
      <legend className="fieldset-legend"> {label->React.string} </legend>
      {children}
    </div>
  }
}

@Jsx.element
let make = props => {
  let children = <InputBase {...props} className="input 2xl:input-lg w-full" />
  <FormControl label={props.label->Option.getOr("")}> {children} </FormControl>
}
