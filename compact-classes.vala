public int main (string[] args) {
	var animals = new Animal[] {};
	animals += new Badger ();
	animals += new Snake ();

	foreach (unowned Animal animal in animals) {
		stdout.printf ("Animal: %s\n", animal.name);
	}

	return 0;
}

[Compact]
private abstract class Animal {
	public abstract string name { get; }
}

[Compact]
private class Badger : Animal {
	public override string name {
		get {
			return "Badger";
		}
	}
}

[Compact]
private class Snake : Animal {
	public override string name {
		get {
			return "Snake";
		}
	}
}
