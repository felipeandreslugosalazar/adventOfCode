input = "- / (dir)
- a (dir)
  - e (dir)
    - i (file, size=584)
  - f (file, size=29116)
  - g (file, size=2557)
  - h.lst (file, size=62596)
- b.txt (file, size=14848514)
- c.dat (file, size=8504156)
- d (dir)
  - j (file, size=4060174)
  - d.log (file, size=8033020)
  - d.ext (file, size=5626152)
  - k (file, size=7214296)"

input = input
  .split("\n")
  .map! { |e| e.gsub!(/- /, "") }

pp input