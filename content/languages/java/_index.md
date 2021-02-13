---
title: "Java"
date: 2021-02-13T14:24:23-05:00
draft: false
---

## Flatten list of lists

```java
Product product1 = Product.builder().tags(asList("tag1", "tag2")).build();
Product product2 = Product.builder().tags(asList("tag2", "tag3")).build();
List<Product> products = asList(product1, product2);
List<String> listOfTags = products.stream()
                            .flatMap(product -> product.getTags().stream())
                            .collect(Collectors.toList());
```

Given you have a set of lists, if you want to combine all the lists into one big list, use `flatMap`.

## Merge two lists

{{<highlight java>}}
List<Integer> listOfOdds = asList(1,3,5,7,9);
List<Integer> listOfEvens = asList(2,4,6,8,10);
List<Integer> listOfAll = Stream.concat(
                            listOfOdds.stream(),
                            listOfEvens.stream()
                          ).collect(Collectors.toList());
{{</highlight>}}

Given two lists, to merge them into one list, use `Stream.concat`

## Reading files

### Using Scanner

{{<highlight java>}}
Scanner scanner = new Scanner(MyClass.class.getClass().getResourceAsStream("/file.txt"));
while(scanner.hasNext()) {
    System.out.println(scanner.nextLine());
}
{{</highlight>}}

If file `file.txt` is on the classpath, this will use a classloader to create an InputStream to the file:

`this` can only be used if the context is non-static. If reading from a static method or context,
use `MyClass.class.getResourceAsStream(...)`

## Non-null checks (Java 1.7+)

{{<highlight java>}}
public class Car {
    private final Engine engine;
    private final Transmission transmission;

    public Car(Engine engine, Transmission transmission) {
        this.engine = Objects.requireNonNull(engine, "Engine cannot be null");
        this.transmission = Objects.requireNonNull(transmission, "Transmission cannot be null");
    }

    ...
}
{{</highlight>}}

In JDK7, `Objects.requireNonNull` was introduced to be able to check if an object is null or not.
It can be used to fail fast when wiring up objects at runtime.

## Hash Functions

[Java Secure Coding Practices](https://www.securecoding.cert.org/confluence/display/java/Security:+Introduction)

[Hashing Passwords with Java](https://www.securecoding.cert.org/confluence/display/java/MSC62-J.+Store+passwords+using+a+hash+function)

### Cryptographic Hash Functions

| Lean On...                         | Avoid... (birthday, collision attacks, crypto-broken) |
| :---                               | :--- |
| SHA-2 (> 256)                      | MD5 |
| SHA-3                              | SHA1 |
| PBKDF2WithHmacSHA1                 | - |
| PBKDF2WithHmacSHA512               | - |
| Bcrypt \(std. in Spring Security\) | - |

## Generate Excel workbook, spreadsheet, and table with formatting

As of version Apache POI `4.0.0`,

```java
XSSFWorkbook workbook = new XSSFWorkbook();
XSSFSheet sheet = workbook.createSheet("Architecture");

//  < v4.0.0
XSSFTable table = sheet.createTable();

// >= 4.0.0
XSSFTable table = sheet.createTable(null);
CTTable cttable = table.getCTTable();

cttable.setDisplayName("Table1");
cttable.setId(1);
cttable.setName("Test");
cttable.setRef("A1:C11");
cttable.setTotalsRowShown(false);

CTTableStyleInfo styleInfo = cttable.addNewTableStyleInfo();
styleInfo.setName("TableStyleMedium2");
styleInfo.setShowColumnStripes(false);
styleInfo.setShowRowStripes(true);

CTTableColumns columns = cttable.addNewTableColumns();
columns.setCount(3);
for (int i = 1; i <= 3; i++) {
  CTTableColumn column = columns.addNewTableColumn();
  column.setId(i);
  column.setName("Column" + i);
}

for (int r = 0; r < 2; r++) {
  XSSFRow row = sheet.createRow(r);
  for(int c = 0; c < 3; c++) {
    XSSFCell cell = row.createCell(c);
    if(r == 0) { //first row is for column headers
      //content **must** be here for table column names
      cell.setCellValue("Column"+ (c+1));
    } else {
      cell.setCellValue("Data.")
    }
  }
}    

try (FileOutputStream outputStream =
      new FileOutputStream("ExcelTableTest.xlsx")) {
  workbook.write(outputStream);
}
```