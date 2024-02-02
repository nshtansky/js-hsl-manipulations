declare namespace __AdaptedExports {
  /** Exported memory */
  export const memory: WebAssembly.Memory;
  /**
   * assembly/index/lch
   * @param lightness `f64`
   * @param chroma `f64`
   * @param hue `f64`
   * @param length `u32`
   */
  export function lch(lightness: number, chroma: number, hue: number, length: number): void;
}
/** Instantiates the compiled WebAssembly module with the given imports. */
export declare function instantiate(module: WebAssembly.Module, imports: {
}): Promise<typeof __AdaptedExports>;
