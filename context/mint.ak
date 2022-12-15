use elude/context.{PolicyId}

pub type Mint {
  currency_symbol: PolicyId,
}

pub type ScriptContext =
  context.ScriptContext(Mint)
