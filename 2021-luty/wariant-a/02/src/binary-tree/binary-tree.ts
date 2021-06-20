export class Leaf {
  toString() {
    return "Leaf";
  }
}

export class BinaryTreeNode<T> {
  constructor(
    public value: T,
    public left: BinaryTreeNode<T> | Leaf,
    public right: BinaryTreeNode<T> | Leaf
  ) {}

  toString(): string {
    return `[${this.value} ${this.left.toString()} ${this.right.toString()}]`;
  }
}

export class BinaryTree<T> {
  constructor(public root: BinaryTreeNode<T> | Leaf) {}

  toString() {
    return this.root.toString();
  }
}

export const isBST = (tree: BinaryTree<number>) => {
  if (tree.root instanceof Leaf) {
    return true;
  }

  const stack: (BinaryTreeNode<number> | Leaf)[] = [tree.root];
  let prev = tree.root.value;
  let node: BinaryTreeNode<number> | Leaf | undefined;
  while ((node = stack.pop())) {
    console.log({ node });
    if (!node || node instanceof Leaf) {
      continue;
    }

    if (node.value < prev) {
      return false;
    }

    stack.push(node.right);
    stack.push(node.left);
  }

  return true;
};

export const removeMinFromBST = <T>(tree: BinaryTree<T>) => {
  if (tree.root instanceof Leaf) {
    return;
  }

  if (tree.root.left instanceof Leaf) {
    tree.root = tree.root.right;
    return;
  }

  let parent = tree.root;
  let child = tree.root.left;
  while (true) {
    if (child.left instanceof Leaf) {
      parent.left = child.right;
      break;
    } else {
      parent = child;
      child = child.left;
    }
  }
};
