use elude/context.{OutputReference}

pub type Spend {
  outRef: OutputReference,
}

pub type ScriptContext =
  context.ScriptContext(Spend)
