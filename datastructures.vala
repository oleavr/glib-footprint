public int main (string[] args) {
	if (args.length != 2) {
		stderr.printf ("Usage: %s <word>\n", args[0]);
		return 1;
	}

	unowned string word = args[1];

	var table = new HashTable<string, int> (str_hash, str_equal);
	table["one"] = 1;
	table["two"] = 2;
	table["three"] = 3;

	int n = table[word];
	stdout.printf ("Result: %d\n", n);

	return 0;
}
