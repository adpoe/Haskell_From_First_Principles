data BinaryTree a =
    Leaf
  | Node (BinaryTree a) a (BinaryTree a)
  deriving (Eq, Ord, Show)

insert' :: Ord a => a -> BinaryTree a -> BinaryTree a
insert' b Leaf = Node Leaf b Leaf  -- Make the root, if we insert into an empty tree; also base case for our inserts
insert' b (Node left a right)
  | b == a  = Node left a right  -- if b == a, we don't store b in this tree implementation. No dupes.
  | b < a   = Node (insert' b left) a right  -- if b < a, insert int left subtree, recursively
  | b > a   = Node left a (insert' b right)  -- insert into right subtree, otherwise


mapTree :: (a -> b) ->  BinaryTree a -> BinaryTree b
mapTree _ Leaf = Leaf
mapTree f (Node left a right) =
  Node (mapTree f left) (f a) (mapTree f right)  -- just recurse and apply the function until we hit leaves


testTree :: BinaryTree Integer
testTree = Node (Node Leaf 3 Leaf) 1 (Node Leaf 4 Leaf)

mapExpected =
  Node (Node Leaf 4 Leaf) 2 (Node Leaf 5 Leaf)

-- acceptance test for mapTree
mapOkay =
  if mapTree (+1) testTree == mapExpected
  then print "yup okay!"
  else error "test failed!"

-- Do Tree Traversals and Built a Visitation List for each
preorder :: BinaryTree a -> [a]
preorder Leaf = []
preorder (Node left root right) = root : preorder left ++ preorder right
-- NOTE: Need to use the ++ so each list gets built separately and then concatenated
-- after it hits bottom

inorder :: BinaryTree a -> [a]
inorder Leaf = []
inorder (Node left root right) = inorder left ++ [root] ++ inorder right
-- NOTE:  Need to put root in its own list so we can concatenate

postorder :: BinaryTree a -> [a]
postorder Leaf = []
postorder (Node left root right) = postorder left ++ postorder right ++ root : []
-- Similarly, here. Need to Cons root onto a list, since it'll be the bottom value

testTree' :: BinaryTree Integer
testTree' = Node (Node Leaf 1 Leaf) 2  (Node Leaf 3 Leaf)

testPreorder :: IO ()
testPreorder =
  if preorder testTree' == [2,1,3]
  then putStrLn "preorder fine!"
  else putStrLn "Bad new bears."

testInorder :: IO ()
testInorder =
  if inorder testTree' == [1,2,3]
  then putStrLn "inorder fine!"
  else putStrLn "Bad new bears"


testPostOrder :: IO ()
testPostOrder =
  if postorder testTree' == [1,3,2]
  then putStrLn "postorder fine!"
  else putStrLn "Bad new bears"

main :: IO ()
main = do
  testPreorder
  testInorder
  testPostOrder

