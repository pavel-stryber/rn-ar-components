# rn-ar-components

RN augmented reality components

## Installation

```sh
npm install rn-ar-components
```

## Usage

```js
import { ARView, FRView, ImageAnchor } from 'rn-ar-components';

// ...
<ARView style={{ width: '100%', height: 500 }}>
  <ImageAnchor
    name="calc"
    path="calc_photo"
    onDetect={(e) => {
      // e.nativeEvent.name
    }}
  />
</ARView>
```

## Contributing

See the [contributing guide](CONTRIBUTING.md) to learn how to contribute to the repository and the development workflow.

## License

MIT
