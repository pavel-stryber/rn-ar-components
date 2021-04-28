import * as React from 'react';
import { View, Text, Button } from 'react-native';
import { ARView, FRView, ImageAnchor } from 'rn-ar-components';

export default function App() {
  const [text, setText] = React.useState('');
  const [anchorVisibility, setAnchorVisibility] = React.useState(true);
  const [anchorName, setAnchorName] = React.useState('calc');
  const arViewRef = React.useRef(null);

  const onImageDetected = (name: String) => {
    setText(`${text}, ${name}`);
  };
  const onPressReset = () => {
    // @ts-ignore
    arViewRef.current.restartSession();
  };
  const onPressHideAnchor = () => {
    setAnchorVisibility(false);
  };
  const onPressChangeAnchor = () => {
    setAnchorName('dummy');
  };

  return (
    <View style={{ flex: 1 }}>
      <ARView style={{ width: '100%', height: 500 }} ref={arViewRef}>
        {anchorVisibility && (
          <ImageAnchor
            name={anchorName}
            path="calc_photo"
            onDetect={(e) => {
              console.log('detected');
              onImageDetected(e.nativeEvent.name);
            }}
          />
        )}
        <ImageAnchor
          name="passport"
          path="passport"
          onDetect={(e) => {
            onImageDetected(e.nativeEvent.name);
          }}
        />
      </ARView>
      <View style={{ backgroundColor: '#fff' }}>
        <Button title="Reset session" onPress={onPressReset} />
        <Button title="Hide Anchor" onPress={onPressHideAnchor} />
        <Button title="Change Anchor" onPress={onPressChangeAnchor} />
        <Text>{text}</Text>
      </View>
    </View>
  );
}

/*
<FRView style={{ flex: 1 }} />
 */
/*
<ARView style={{ width: '100%', height: 500 }} ref={arViewRef}>
        {anchorVisibility && (
          <ImageAnchor
            name={anchorName}
            path="calc_photo"
            onDetect={(e) => {
              console.log('detected');
              onImageDetected(e.nativeEvent.name);
            }}
          />
        )}
        <ImageAnchor
          name="passport"
          path="passport"
          onDetect={(e) => {
            onImageDetected(e.nativeEvent.name);
          }}
        />
      </ARView>
      <View style={{ backgroundColor: '#fff' }}>
        <Button title="Reset session" onPress={onPressReset} />
        <Button title="Hide Anchor" onPress={onPressHideAnchor} />
        <Button title="Change Anchor" onPress={onPressChangeAnchor} />
        <Text>{text}</Text>
      </View>
 */
