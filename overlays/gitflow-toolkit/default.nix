{ channels, inputs, ... }:

final: prev: {
  gitflow-toolkit = inputs.self.packages.${final.system}.gitflow-toolkit;
}
