import std.string;
import std.stdio;

void main()
{
	string s;
	bool inDD = false;
	while ((s=readln())!=null)
	{
		if (s.startsWith("        "))
			s = s[8..$];
		if (s.startsWith("<html>") || s.startsWith("<META") || s.startsWith("<title>") || s.startsWith("</head>") || s.startsWith("<!--"))
			continue;
		if (s.startsWith("<dd>"))
			inDD = true;
		else
		if (s.startsWith("</dd>"))
			inDD = false;
		if (!inDD)
			s = s.replace("<br><br>", "");
		else
			s = s.replace("</ul><br><br>", "</ul>");
		writef("%s", s);
	}
}

bool startsWith(string str, string start)
{
	return str.length >= start.length && str[0..start.length]==start;
}
