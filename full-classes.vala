public int main (string[] args) {
	var animals = new Animal[] {};
	animals += new Badger ();
	animals += new Snake ();

	foreach (unowned Animal animal in animals) {
		stdout.printf ("Animal: %s\n", animal.name);
	}

	return 0;
}

private abstract class Animal {
	public abstract string name { get; }
}

private class Badger : Animal {
	public override string name {
		get {
			return "Badger";
		}
	}
}

private class Snake : Animal {
	public override string name {
		get {
			return "Snake";
		}
	}
}
