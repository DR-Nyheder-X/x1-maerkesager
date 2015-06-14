# Mærkesager

This is meant to be run as a _CodeComponent_ inside a Webcms article on dr.dk.

## Development

Run a live (and hot) reloading dev server with

```sh
$ npm start
```

## Production

Build for distribution using

```sh
$ npm run build
```

Then move it to the network folder `Z:` or whatever it's called. And reference it in a code component using

```html
<script src='http://dr.dk/wherever/you/put/it'></script>
```

