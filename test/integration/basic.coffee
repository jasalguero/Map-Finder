describe "Check HTML is returned", ->
  visit("/").then ->
    ok exists("*"), "Found HTML!"