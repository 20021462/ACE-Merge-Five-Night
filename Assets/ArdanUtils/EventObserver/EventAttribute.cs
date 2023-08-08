using System;
using System.Reflection;

public enum EventKey {
    AssignPlayer,
    CheckpointEndgame,
    Endgame,
    LoadScene,
    LoadLevel,
}
[AttributeUsage(AttributeTargets.Method | AttributeTargets.Property | AttributeTargets.Class)]
public class EventAttribute : Attribute {
    public EventKey key;

    public EventAttribute() { }
    public EventAttribute(EventKey key) => this.key = key;
}

[AttributeUsage(AttributeTargets.Class)]
public class ContDestroyOnloadAttribute : Attribute {
    public bool isTrue;

    public ContDestroyOnloadAttribute() { }
    public ContDestroyOnloadAttribute(bool isTrue) => this.isTrue = isTrue;
}

public class PlayerPrefAttribute : Attribute {
    public enum Key // Khong duoc thay doi key, key : playerpref
    {
    }
    public Key key;
    public PlayerPrefAttribute(Key key) => this.key = key;
}