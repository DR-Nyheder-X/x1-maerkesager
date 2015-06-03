/**
 * returns a function that avoids click defaults then
 * calls stuff with binding and things
 * @arg binding Object context
 * @arg fn String function name
 * @arg ...args Array arguments to apply to fn
 */
export default function clickFn(binding, fn, ...args) {
  return function click(e) {
    e.preventDefault()
    return binding[fn].apply(binding, args)
  }.bind(this)
}

