PgSearch.multisearch_options = {
  :using => {
    :tsearch => {
      :prefix => true,
      :dictionary => "english",
      :any_word => true
    },
    :trigram => {
      :threshold => 0.2
    }
  }
}