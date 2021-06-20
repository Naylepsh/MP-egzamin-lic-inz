import {
  BinaryTree,
  BinaryTreeNode,
  isBST,
  Leaf,
  removeMinFromBST,
} from "./binary-tree";

test("(1 leaf leaf) is sorted", () => {
  const tree = new BinaryTree(new BinaryTreeNode(1, new Leaf(), new Leaf()));

  expect(isBST(tree));
});

test("(2 (1 leaf leaf) (3 leaf leaf)) is sorted", () => {
  const tree = new BinaryTree(
    new BinaryTreeNode(
      2,
      new BinaryTreeNode(1, new Leaf(), new Leaf()),
      new BinaryTreeNode(3, new Leaf(), new Leaf())
    )
  );

  expect(isBST(tree));
});

test("(1 (2 leaf leaf) (3 leaf leaf)) is NOT sorted", () => {
  const tree = new BinaryTree(
    new BinaryTreeNode(
      1,
      new BinaryTreeNode(2, new Leaf(), new Leaf()),
      new BinaryTreeNode(3, new Leaf(), new Leaf())
    )
  );

  expect(isBST(tree));
});

test("removeMinFromBST from (2 (1) (3)) replaces 1 with Leaf", () => {
  const tree = new BinaryTree(
    new BinaryTreeNode(
      2,
      new BinaryTreeNode(1, new Leaf(), new Leaf()),
      new BinaryTreeNode(3, new Leaf(), new Leaf())
    )
  );

  removeMinFromBST(tree);

  const root = tree.root as BinaryTreeNode<number>;
  expect(root.left instanceof Leaf).toBe(true);
});

test("removeMinFromBST from (2 Leaf (3)) replaces 2 with (3)", () => {
  const tree = new BinaryTree(
    new BinaryTreeNode(
      2,
      new Leaf(),
      new BinaryTreeNode(3, new Leaf(), new Leaf())
    )
  );

  removeMinFromBST(tree);

  const root = tree.root as BinaryTreeNode<number>;
  expect(root.value).toBe(3);
});
