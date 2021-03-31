import { NativeModules } from 'react-native';

type RnArComponentsType = {
  multiply(a: number, b: number): Promise<number>;
};

const { RnArComponents } = NativeModules;

export default RnArComponents as RnArComponentsType;
