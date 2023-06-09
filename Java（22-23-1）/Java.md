# Java

- JDK – Java Development Toolkit
	- J2SE – Java 2 Standard Edition
	- J2EE – Java 2 Enterprise Edition
	- J2ME – Java 2 Micro Edition
- JRE – Java Runtime Environment

JDK 是 java 开发工具包，在其安装目录下面有五个文件夹、一些描述文件、一个 src 压缩文件。bin、lib、 jre 这四个文件夹起作用。可以看出来 JDK 包含 JRE，而 JRE 包含 JVM。

JDK 是用于 java 程序的开发,而 jre 则是只能运行 class 而没有编译的功能。

(vscode 如果出现 class not found，清除 language serve workspace)

## L01

### 数据类型

![[Pasted image 20230203133042.png]]

注意 `char` 是 16 位。
java 中单个 char 类型描述的字符是 **有限的**，**单个 char** 只能描述 unicode 中的 **BMP 范围** 的码位，也就意味着 BMP 范围外的字符 char 是无法表示的。
比如表情符号就不行

java9 之前 String 是使用 `char[]` 实现，后面是 `byte[]` 实现

Wrapper 要用 `equals` 来比较。

强制类型转换（高 ->低）：同 C#

`final` 表示不可修改

不允许在函数作用域内变量同名

标识符允许 `$` 开头，后面也可以用 `$`。

`instanceof`。
从 Java 14 开始，判断 `instanceof` 后，可以直接转型为指定变量，避免再次强制转型。例如

```java
Object obj = "hello";
if (obj instanceof String s) {
    // 可以直接使用变量s:
    System.out.println(s.toUpperCase());
}
```

对于局部变量，声明可以不赋初值，但如果在使用它的地方仍然没有赋值，那么会 CE。
对于类成员，如果不初始化会有默认值（如 0，null）。

## L02

**写 class 前要写 `package`！！！**

关于内部类
只有成员内部类才能加 static 变成静态内部类

非静态内部类是跟外部类的实例绑定的
成员内部类可以无条件访问外部类的所有成员属性和成员方法（包括 private 成员和静态成员）

访问外部类同名成员：

```java
外部类.this.成员变量
外部类.this.成员方法
```

**成员内部类中不能存在任何 static 的变量和方法**

对于 final static 的变量是存放在常量池中的，不涉及到类的加载

在 Java 中，任何 `class` 的构造方法，第一行语句必须是调用父类的构造方法。如果没有明确地调用父类的构造方法，编译器会帮我们自动加一句 `super();`

如果没有 ctor，那么会生成缺省。

![[Pasted image 20230203145005.png]]

一个类中可以有多个静态初始化块和多个普通初始化块；静态初始化块的执行要早于普通初始化块；同一个类型的初始化块的执行顺序取决于定义的先后顺序

访问控制（Access Control）

注意 `protected` 允许同一包其他类访问。

![[Pasted image 20230203150219.png]]

![[Pasted image 20230203150938.png]]

![[Pasted image 20230203151922.png]]

![[Pasted image 20230203152115.png]]
![[Pasted image 20230203152140.png]]

![[Pasted image 20230203152243.png]]

继承成员隐藏：多态方法是运行时的（默认就是 override），field 看声明类型。

![[Pasted image 20230203152943.png]]

![[Pasted image 20230203153031.png]]

接口允许 `default`：
但是考试不考虑

```java
interface Person {
    String getName();
    default void run() {
        System.out.println(getName() + " run");
    }
}
```

在 interface 里面的变量都是 public static final 的
**接口的成员特点**：
A: 成员变量 只能是常量。默认修饰符 **public static final**
B: 成员方法 只能是抽象方法。默认修饰符 **public abstract**
如果不是 static 的，这个变量来自哪一个接口就会产生歧义，所以实现类使用接口中的变量必须通过接口名指定，也就只能定为 static 的。
子类修改了值会影响到其他所有子类，因此就不应该允许子类修改这个值，所以也必须定义为 final。

支持 `abstract` 抽象方法、抽象类。抽象方法只能在抽象类。

## L03

Exception（异常）和 Error（错误）
异常能被程序本身可以处理，错误是无法处理
大多数错误与代码编写者执行的操作无关，而表示代码运行时 JVM 出现的问题

Runtime Exception 不需要声明，如 `NullPointerException`，`ArithmeticException`

![[Pasted image 20230203154800.png]]
![[Pasted image 20230203154806.png]]

![[Pasted image 20230203155330.png]]

重写方法一定不能抛出新的检査异常或者比被重写方法声明更加宽泛的检査型异常。 例如，父类的一个方法声明了一个检査异常 IOException，在重写这个方法时就不能抛出 Exception，只能拋出 IOException 的子类异常，可以抛出非检査异常。

`catch` 时，必须先 catch 子类，若放在父类后就 catch 不到了，会 CE。

![[Pasted image 20230203155631.png]]

## L04 IO

`File` 相当于 `Path`。

![[Pasted image 20230203155814.png]]

这里排序有个 `Collections.reverseOrder()`

![[Pasted image 20230203155910.png]]

![[Pasted image 20230203160125.png]]

为什么是 int ？
最终调用 `c` 函数，参数类型是 int，这里用 int 不会强转。
int 到 char 也不用强转。

![[Pasted image 20230203160324.png]]
![[Pasted image 20230203160348.png]]
![[Pasted image 20230217101929.png]]

`InputStream`, `OutputStream`, `Reader`, `Writer` 都是抽象类

`FileInputSteam` 可以用 `String` 或 `File` 构造。

`FileReader` 和 `FileInputStream` 地位相当。
`InputStreamReader` 参数为 `InputStream`，附加 `Charset`。
对应 `OutputStreamWriter`。
`InputStream` 和 `Reader` 结合起来，用户使用字符串，但操作字符流。

`PrintStream` 构造参数为 `File` 或 `OutputStream`。
`PrintWriter` 构造参数为 `File`, `OutputStream`, `Writer`。
基本用法跟 `sysout` 差不多。从 `File` 构造实现效果基本一样，但内部机制不一样。网络通信要 `PrintStream`。

`Scanner` 构造参数为 `File`, `InputStream`, `Path`，用 `nextTTT` 和 `hasNextTTT` 来读取基本类型。需要 close！

`DataInputStream`, `DataOutputStream` 可以读写基本数据类型（二进制）。
`ObjectInputStream` 提供的接口类似，但额外可以序列化/反序列化 `Object`。
`ByteArrayInputStream` 直接 `byte[]` 构造。
`ByteArrayOutputStream` 无参构造，用 `toString` 或 `toByteArray` 获取内容。

`BufferedInputStream` 继承了 `InputStream`，在 `InputStream` 外面套了一层。
`BufferedOutputStream`, `BufferedReader`, `BufferedWriter`。

后面的例子看课件

## L05 Collection

```java
int[] a = new int[10];
int[] b = new int[]{1, 5};
```

`java.util.Arrays`：
- `binarySearch`
- `sort`
- `copyOf(original, newLength)`
- `copyOfRange(original, from, to)`
- `hashCode`。每个元素相同的数组的 hash 相同。
- `equals`
- `deepEquals`。会递归判断。
- `deepHashCode`。
- `toString` / `deepToString`

`List` 的 `remove` 有删除元素和删除下标的重载。
不支持 `List<int/float/…>`
用 `get` / `set` 来修改，`isEmpty` 判空。

`ArrayList` 用 `trimToSize` 来缩减。

`LinkedList`：`add`，`addFirst`，`addLast`，`removeFirst`，`removeLast`。其中 `add` 可在尾部加，也可指定位置。

`toArray()` 返回的是 `Object[]`，无类型信息，如果要类型需要 `toArray(new T[n])`。

```java
Integer[] array = list.toArray(Integer[]::new); // deprecated
List<Integer> list = List.of(array); // 但是只读
Arrays.asList(array);
```

`List` 内部用 `equals` 判断相等。

`Map` - `HashMap`, `SortedMap`
用 `put` / `get` / `remove`
`keySet: Set` / `values: Collection` / `entrySet: Set`，

用 `iterator` 遍历：

![[Pasted image 20230204180750.png]]

```java
for (String key : map.keySet()) {
    Integer value = map.get(key);
    System.out.println(key + " = " + value);
}
for (Map.Entry<String, Integer> entry : map.entrySet()) {
    String key = entry.getKey();
    Integer value = entry.getValue();
    System.out.println(key + " = " + value);
}
```

注意，`key` 不一定有序。

`Map.of(k1, v1, k2, v2, …)`

```java
Map<String, Integer> map = new HashMap<>(10000); // 指定容量
```

`SortedMap` 是接口，它的实现类是 `TreeMap`

使用 `TreeMap` 时，放入的 Key 必须实现 `Comparable` 接口。

类似地有 `Set`, `HashSet`, `SortedSet`, `TreeSet`

`Collections` 提供了一系列方法来创建空集合：

- 创建空 List：`List<T> emptyList()` 等价于 `List.of()`
- 创建空 Map：`Map<K, V> emptyMap()`
- 创建空 Set：`Set<T> emptySet()`

`Collections` 提供了一系列方法来创建一个单元素集合：

- 创建一个元素的 List：`List<T> singletonList(T o)`
- 创建一个元素的 Map：`Map<K, V> singletonMap(K key, V value)`
- 创建一个元素的 Set：`Set<T> singleton(T o)`

`sort`, `shuffle`

## L08 Multi-thread

继承 `Thread` 或实现 `Runnable`，实现 `run` 方法。
`Thread` 本身实现了 `Runnable`。注意 `Runnable` 只有单接口方法。

如果两个 `Thread` 调用同一个 `Runnable` ，那么 `run` 独立运行，但是共享同一个对象。

优先级 1~10，越高越优先。但不能保证执行顺序。一般优先级高的执行完后才会执行优先级低的。

`sleep` 线程自己调用，保持占有权。
`wait` 是为了获取资源，不保有对象占用权。

Yield 告诉当前正在执行的线程把运行机会交给线程池中拥有相同优先级的线程。
Yield 不能保证使得当前正在运行的线程迅速转换到可运行的状态

![[Pasted image 20230217112542.png]]

加了 `synchronized` 就是线程安全的。

`wait()` 主动放弃当前对象的控制权。需要放在 `while` 里实现等待直到条件达成。
`notifyAll()` 让所有处于等待状态的线程变成 ready 状态。`notify` 只会唤醒一个。
这 3 个方法必须在 `synchronized` 块里。

`wait` 需要 lock，可以让别的线程挂起。
`sleep` 只能让自己忙等。
注意 `wait` 最多等指定时间，如果没事就立刻恢复执行。

## L10 JDBC

用字符串拼接的方式生成 SQL 有 SQL 注入的风险

查询结果永远是 `ResultSet`，即使只有一个标量

`prepareStatement` 是批处理的。
每次更新用 `.addBatch(); .clearParameters();`，用 `.executeBatch(); .clearBatch();` 收尾。

上板子

```java
// String dbURl = "jdbc:mysql://localhost:3306/university?user=root&password=root";
// try {  
//     Class.forName("com.mysql.cj.jdbc.Driver");  
// } catch (ClassNotFoundException e) {  
//     throw new RuntimeException(e);  
// }  
try {  
   // con = DriverManager.getConnection(dbURl);  
   con = DriverManager.getConnection("jdbc:mysql://localhost:3306/university", "root", "root");  
} catch (SQLException e) {  
   throw new RuntimeException(e);  
}
```

```java
public Result userLogin(String username, String password) {  
   try {  
      String sql = """  
            SELECT uid, username, password_, utype  
            FROM user  
            WHERE username = ?;  
            """;  
      var stmt = con.prepareStatement(sql);  
      stmt.setString(1, username);  
      var rs = stmt.executeQuery();  
      if (!rs.next()) {  
         return Result.fail("User not found!");  
      }  
      if (!rs.getString("password_").equals(password)) {  
         return Result.fail("Incorrect password!");  
      }  
      int type = rs.getInt("utype");  
      if (type == User.STUDENT) {  
         sql = """  
               SELECT uid, sid  
               FROM student  
               WHERE uid = ?;  
               """;  
         stmt = con.prepareStatement(sql);  
         stmt.setInt(1, rs.getInt("uid"));  
         rs = stmt.executeQuery();  
         if (!rs.next()) {  
            return Result.fail("Student not found!");  
         }  
         currentUser = new Student(rs.getInt("uid"), rs.getInt("sid"), username);  
      } else {  
         currentUser = new User(rs.getInt("uid"), type, username);  
      }  
      stmt.close();  
      return Result.success(String.format("Successfully login as %s. Welcome, %s.",  
            type == 0 ? "student" : "administrator",  
            username));  
   } catch (SQLException e) {  
      // e.printStackTrace();  
      return Result.fail(e.getMessage());  
   }  
}
```

## L11

服务器至少写 3 个类。

`while (true)` 陷阱：如果里面只有一句话，`capacity` 计数器得不到更新。可以放 `sleep(1)`，使 JVM 有机会更新计数器。

## 补充

IO 流是一种流式的数据输入/输出模型：
- 二进制数据以 `byte` 为最小单位在 `InputStream`/`OutputStream` 中单向流动；
- 字符数据以 `char` 为最小单位在 `Reader`/`Writer` 中单向流动。

Java 标准库的 `java.io` 包提供了同步 IO 功能：
- 字节流接口：`InputStream`/`OutputStream`；
- 字符流接口：`Reader`/`Writer`。

文件复制：

```java
static void copy(String source, String target) throws IOException {   try (InputStream input = new FileInputStream(source);
     OutputStream output = new FileOutputStream(target)) {
      input.transferTo(output);
}
```

`PrintStream` 是一种能接收各种数据类型的输出，打印数据时比较方便：
- `System.out` 是标准输出；
- `System.err` 是标准错误输出。
`PrintWriter` 是基于 `Writer` 的输出。

直接读写：

```java
byte[] data = Files.readAllBytes(Path.of("/path/to/file.txt"));
```

```java
// 默认使用UTF-8编码读取:
String content1 = Files.readString(Path.of("/path/to/file.txt"));
// 可指定编码:
String content2 = Files.readString(Path.of("/path", "to", "file.txt"), StandardCharsets.ISO_8859_1);
// 按行读取并返回每行内容:
List<String> lines = Files.readAllLines(Path.of("/path/to/file.txt"));
```

```java
// 写入二进制文件:
byte[] data = …
Files.write(Path.of("/path/to/file.txt"), data);
// 写入文本并指定编码:
Files.writeString(Path.of("/path/to/file.txt"), "文本内容…", StandardCharsets.ISO_8859_1);
// 按行写入文本:
List<String> lines = …
Files.write(Path.of("/path/to/file.txt"), lines);
```

此外，`Files` 工具类还有 `copy()`、`delete()`、`exists()`、`move()` 等快捷方法操作文件和目录。

`Paths` 没啥用，`Path.of` 都支持。

数组复制：

```java
Arrays.copyOf(scores, scores.length);
```
