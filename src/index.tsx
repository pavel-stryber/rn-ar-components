import React from 'react';
import {
  requireNativeComponent,
  ViewStyle,
  UIManager,
  findNodeHandle,
} from 'react-native';

type FRViewProps = {
  style?: ViewStyle;
  children?: JSX.Element | JSX.Element[];
};
type ARViewProps = {
  style?: ViewStyle;
  children?: JSX.Element | JSX.Element[];
};
type IAOnDetectEvent = {
  nativeEvent: {
    name: String;
  };
};
type ImageAnchorProps = {
  name?: String;
  path: String;
  onDetect?: (e: IAOnDetectEvent) => any;
};
const FRViewComponent = requireNativeComponent('FRView');
const ARViewComponent = requireNativeComponent('ARView');
const ImageAnchorComponent = requireNativeComponent('ImageAnchor');

export const FRView = (props: FRViewProps) => <FRViewComponent {...props} />;
export class ARView extends React.Component<ARViewProps> {
  arViewRef = React.createRef();
  restartSession = () => {
    UIManager.dispatchViewManagerCommand(
      // @ts-ignore
      findNodeHandle(this.arViewRef.current),
      // @ts-ignore
      UIManager['ARView'].Commands.restartSessionFromManager,
      []
    );
  };
  render() {
    return (
      <ARViewComponent
        {...this.props}
        // @ts-ignore
        ref={this.arViewRef}
      />
    );
  }
}
export const ImageAnchor = (props: ImageAnchorProps) => (
  <ImageAnchorComponent {...props} />
);
