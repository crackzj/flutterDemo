
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyImagePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("image & icon"),
        actions: [
          IconButton(onPressed: (){
            Navigator.pushNamed(context, "/switch");
          }, icon: Icon(Icons.arrow_forward)),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Image widget 有一个必选的image参数，它对应一个 ImageProvider。下面我们分别演示一下如何从 asset 和网络加载图片。"),
          Text("1）从asset中加载图片",style: TextStyle(
            fontWeight: FontWeight.bold,
          ),),
          Text("1.在工程根目录下创建一个images目录，并将图片 avatar.png 拷贝到该目录。"),
          Text("2.在pubspec.yaml中的flutter部分添加如下内容:"),
          Padding(padding: EdgeInsets.all(16.0),child: Text.rich(TextSpan(
            children: [
              TextSpan(text: "assets:",style: TextStyle(color: Colors.purple)),
              TextSpan(text: " - images/avatar.png",style: TextStyle(color: Colors.deepOrange)),
            ]
          )),),
          Text("3.加载该图片"),
          MyImageLocal(),
          Text("2）从网络加载图片",style: TextStyle(
            fontWeight: FontWeight.bold,
          ),),
          MyImageNetwork(),
          MyImageParams(),
          MyIconPage(),
          MyCustomIconfont(),
        ],
      ),
      ),
    );
  }
}

/**
 * Image widget 有一个必选的image参数，它对应一个 ImageProvider。下面我们分别演示一下如何从 asset 和网络加载图片。
 */
class MyImageLocal extends StatelessWidget {
  final image = AssetImage("assets/images/avatar.webp");
  @override
  Widget build(BuildContext context) {
    return Image(image: image);
  }
}

class MyImageNetwork extends StatelessWidget {
  final String url = "http://e.hiphotos.baidu.com/image/pic/item/a1ec08fa513d2697e542494057fbb2fb4316d81e.jpg";
  @override
  Widget build(BuildContext context) {
    return Image(image: NetworkImage(url),width: 100.0,);
  }
}

/**
 * 参数
 */
class MyImageParams extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final String url = "http://e.hiphotos.baidu.com/image/pic/item/a1ec08fa513d2697e542494057fbb2fb4316d81e.jpg";
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("3）参数",style: TextStyle(fontWeight: FontWeight.bold),),
        Text("Image在显示图片时定义了一系列参数，通过这些参数我们可以控制图片的显示外观、大小、混合效果等。我们看一下 Image 的主要参数："),
        Text("const Image({"),
        Text("..."),
        Text("this.width, //图片的宽"),
        Text("this.height, //图片高度"),
        Text("this.color, //图片的混合色值"),
        Text("this.colorBlendMode, //混合模式"),
        Text.rich(TextSpan(
          children: [
            TextSpan(text: "this.fit,"),
            TextSpan(text: " //缩放模式",style: TextStyle(color: Colors.grey)),
          ]
        )),
        Text.rich(TextSpan(
          children: [
            TextSpan(text: "this.alignment = Alignment.center,"),
            TextSpan(text: " //对齐方式",style: TextStyle(color: Colors.grey)),
          ]
        )),
        Text.rich(TextSpan(
            children: [
              TextSpan(text: "this.repeat = ImageRepeat.noRepeat,"),
              TextSpan(text: " //重复方式",style: TextStyle(color: Colors.grey)),
            ]
        )),
        Text("..."),
        Text("})"),
        Text("width、height：用于设置图片的宽、高，当不指定宽高时，图片会根据当前父容器的限制，尽可能的显示其原始大小，如果只设置width、height的其中一个，那么另一个属性默认会按比例缩放，但可以通过下面介绍的fit属性来指定适应规则。",style: TextStyle(height: 1.6),),
        Text("fit：该属性用于在图片的显示空间和图片本身大小不同时指定图片的适应模式。适应模式是在BoxFit中定义，它是一个枚举类型，有如下值：",style: TextStyle(height: 1.6),),
        Padding(padding: EdgeInsets.only(left: 16.0),
          child: Text("fill：会拉伸填充满显示空间，图片本身长宽比会发生变化，图片会变形。"),
        ),
        Padding(padding: EdgeInsets.only(left: 16.0),
          child: Text("cover：会按图片的长宽比放大后居中填满显示空间，图片不会变形，超出显示空间部分会被剪裁。"),
        ),
        Padding(padding: EdgeInsets.only(left: 16.0),
          child: Text("contain：这是图片的默认适应规则，图片会在保证图片本身长宽比不变的情况下缩放以适应当前显示空间，图片不会变形。"),
        ),
        Padding(padding: EdgeInsets.only(left: 16.0),
          child: Text("fitWidth：图片的宽度会缩放到显示空间的宽度，高度会按比例缩放，然后居中显示，图片不会变形，超出显示空间部分会被剪裁。"),
        ),
        Padding(padding: EdgeInsets.only(left: 16.0),
          child: Text("fitHeight：图片的高度会缩放到显示空间的高度，宽度会按比例缩放，然后居中显示，图片不会变形，超出显示空间部分会被剪裁。"),
        ),
        Padding(padding: EdgeInsets.only(left: 16.0),
          child: Text("none：图片没有适应策略，会在显示空间内显示图片，如果图片比显示空间大，则显示空间只会显示图片中间部分。"),
        ),
        Text("一图胜万言！ 我们对一个宽高相同的头像图片应用不同的fit值",style: TextStyle(fontSize: 16.0,height: 1.8),),
        Padding(padding: EdgeInsets.all(16.0),child: Column(
    children: [
          Container(
            width: double.infinity,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.network(url,fit: BoxFit.fill,width: 120.0,),
                Text("BoxFit.fill"),
              ],
            ),
          ),
          Row(
            children: [
              Image(image: NetworkImage(url),width: 120.0,fit: BoxFit.contain,),
              Text("BoxFit.contain"),
            ],
          ),
        Row(
          children: [
            Image.network(url,width: 120.0,fit: BoxFit.cover,),
            Text("BoxFit.cover"),
          ],
        ),
      Row(
        children: [
          Image(image: NetworkImage(url),width: 120.0,fit: BoxFit.fitWidth,),
          Text("BoxFit.fitWitdth"),
        ],
      ),
      Row(
        children: [
          Image(image: NetworkImage(url),width: 120.0,fit: BoxFit.fitHeight,),
          Text("BoxFit.fitHeight"),
        ],
      ),
      Row(
        children: [
          Image(image: NetworkImage(url),width: 120.0,fit: BoxFit.scaleDown,),
          Text("BoxFit.fscaleDown"),
        ],
      ),
      Row(
        children: [
          Image(image: NetworkImage(url),width: 120.0,fit: BoxFit.none,),
          Text("BoxFit.none"),
        ],
      ),
      Text("color和 colorBlendMode：在图片绘制时可以对每一个像素进行颜色混合处理，color指定混合色，而colorBlendMode指定混合模式，下面是一个简单的示例："),
      Image(image: NetworkImage(url),width: 120.0,color: Colors.blue,colorBlendMode: BlendMode.difference,),
      Text("repeat：当图片本身大小小于显示空间时，指定图片的重复规则。简单示例如下："),
      Image(image: NetworkImage(url),width: 100.0,height: 200.0,repeat: ImageRepeat.repeat,),

        ],
        ),),
        Text("Image 缓存",style: TextStyle(fontWeight: FontWeight.bold),),
        Text("Flutter框架对加载过的图片是有缓存的（内存）"),
      ],
    );
  }
}
//Ion
class MyIconPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Flutter 中，可以像Web开发一样使用 iconfont，iconfont 即“字体图标”，它是将图标做成字体文件，然后通过指定不同的字符而显示不同的图片。"),
        Text("在Flutter开发中，iconfont和图片相比有如下优势："),
        Text("1.体积小：可以减小安装包大小。"),
        Text("2.矢量的：iconfont都是矢量图标，放大不会影响其清晰度。"),
        Text("3.可以应用文本样式：可以像文本一样改变字体图标的颜色、大小对齐等。"),
        Text("4.可以通过TextSpan和文本混用。"),
        MyIconfont(),
      ],
    );
  }
}

/**
 * 使用Material Design字体图标
 */
class MyIconfont extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    String icons = "\uE03e";
    icons += " \uE237";
    icons += " \uE287";
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("1.使用Material Design字体图标",style: TextStyle(fontWeight: FontWeight.bold),),
        Text("Flutter默认包含了一套Material Design的字体图标，在pubspec.yaml文件中的配置如下"),
        Text.rich(TextSpan(
          children: [
            TextSpan(text: "flutter:",style:TextStyle(color: Colors.purple) ),
          ]
        )),
        Padding(padding: EdgeInsets.only(left: 16.0),child: Text("uses-material-design: true",style: TextStyle(color: Colors.purple),),),
        Text.rich(TextSpan(
          children: [
            TextSpan(text: "Material Design所有图标可以在其官网查看："),
            TextSpan(text: "https://material.io/tools/icons/",style: TextStyle(color: Colors.blue) ),
          ]
        )),
        Text("我们看一个简单的例子："),
        Text(
         icons,
         style: TextStyle(
           fontFamily: "MaterialIcons",
           fontSize: 24.0,
           color: Colors.green,
         ),
        ),
        Text("通过这个示例可以看到，使用图标就像使用文本一样，但是这种方式需要我们提供每个图标的码点，这并对开发者不友好，所以，Flutter封装了IconData和Icon来专门显示字体图标，上面的例子也可以用如下方式实现："),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.accessible,color: Colors.green),
            Icon(Icons.error, color: Colors.green,),
            Icon(Icons.fingerprint, color: Colors.green,),
          ],
        ),
        Text("Icons类中包含了所有Material Design图标的IconData静态变量定义。"),
      ],
    );
  }
}

class MyCustomIconfont extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("我们也可以使用自定义字体图标。iconfont.cn上有很多字体图标素材，我们可以选择自己需要的图标打包下载后，会生成一些不同格式的字体文件，在Flutter中，我们使用ttf格式即可。"),
        Padding(padding: EdgeInsets.only(top: 20.0,bottom: 20.0),child: Text("假设我们项目中需要使用一个书籍图标和微信图标，我们打包下载后导入："),),
        Text("1.导入字体图标文件；这一步和导入字体文件相同，假设我们的字体图标文件保存在项目根目录下，路径为fonts/iconfont.ttf："),
        Text("fonts:",style: TextStyle(color: Colors.purple),),
        Padding(padding: EdgeInsets.only(left: 16.0),child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text.rich(TextSpan(
              children: [
               TextSpan(text: "- family", style: TextStyle(color: Colors.purple)),
                TextSpan(text: ":  myIcon"),
                TextSpan(text: "  #指定一个字体名",style: TextStyle(color: Colors.grey)),
              ]
            )),
            Padding(padding: EdgeInsets.only(left: 16.0),child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("fonts:",style: TextStyle(color: Colors.purple),),
                Padding(padding: EdgeInsets.only(left: 16.0),child: Text.rich(TextSpan(
                  children: [
                    TextSpan(text: "- asset:",style: TextStyle(color: Colors.purple)),
                    TextSpan(text: "fonts/iconfont.ttf"),
                  ]
                )),)
              ],
            ),)
          ],
        ),),
        Text("2.为了使用方便，我们定义一个MyIcons类，功能和Icons类一样：将字体文件中的所有图标都定义成静态变量："),
        Text.rich(TextSpan(
          children: [
            TextSpan(text: "class",style: TextStyle(color: Colors.purple)),
            TextSpan(text: "  MyIcons",style: TextStyle(color: Colors.blueAccent)),
            TextSpan(text: "  {")
          ]
        )),
        Padding(padding: EdgeInsets.only(left: 16.0),child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("// book 图标", style: TextStyle(color: Colors.grey),),
            Text.rich(TextSpan(
              children: [
                TextSpan(text: "static  const", style: TextStyle(color: Colors.purple)),
                TextSpan(text: "  IconData  ",style: TextStyle(color: Colors.blue)),
                TextSpan(text: "book  =  "),
                TextSpan(text: "const  ",style: TextStyle(color: Colors.purple)),
                TextSpan(text: "IconData",style: TextStyle(color: Colors.blue)),
                TextSpan(text: "(")
              ]
            )),
            Padding(padding: EdgeInsets.only(left: 16.0),child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("0xe614",style: TextStyle(color: Colors.deepOrange),),
                Text.rich(TextSpan(
                  children: [
                    TextSpan(text: "fontFamily:  "),
                    TextSpan(text: "'myIcon'", style: TextStyle(color: Colors.green)),
                  ]
                )),
               Text.rich(TextSpan(
                 children: [
                   TextSpan(text: "matchTextDirection:  "),
                   TextSpan(text: "true",style: TextStyle(color: Colors.deepOrange)),
                 ]
               )),
              ],
            ),),
            Text(");"),
            Text("// 微信图标", style: TextStyle(color: Colors.grey),),
            Text.rich(TextSpan(
                children: [
                  TextSpan(text: "static  const", style: TextStyle(color: Colors.purple)),
                  TextSpan(text: "  IconData  ",style: TextStyle(color: Colors.blue)),
                  TextSpan(text: "book  =  "),
                  TextSpan(text: "const  ",style: TextStyle(color: Colors.purple)),
                  TextSpan(text: "IconData",style: TextStyle(color: Colors.blue)),
                  TextSpan(text: "(")
                ]
            )),
            Padding(padding: EdgeInsets.only(left: 16.0),child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("0xec7d",style: TextStyle(color: Colors.deepOrange),),
                Text.rich(TextSpan(
                    children: [
                      TextSpan(text: "fontFamily:  "),
                      TextSpan(text: "'myIcon'", style: TextStyle(color: Colors.green)),
                    ]
                )),
                Text.rich(TextSpan(
                    children: [
                      TextSpan(text: "matchTextDirection:  "),
                      TextSpan(text: "true",style: TextStyle(color: Colors.deepOrange)),
                    ]
                )),
              ],
            ),),
            Text(");"),
          ],
        ),),
        Padding(padding: EdgeInsets.only(left: 16.0)),
        Text("}"),
        Text("3.使用"),
        Text("Row("),
        Padding(padding: EdgeInsets.only(left: 16.0),child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text.rich(TextSpan(
              children: [
                TextSpan(text: "mainAxisAlignment:  "),
                TextSpan(text: "MainAxisAlignment",style: TextStyle(color: Colors.deepOrange)),
                TextSpan(text: ".center,"),
              ]
            )),
            Text("children:  ["),
            Padding(padding: EdgeInsets.only(left: 16.0),child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text.rich(TextSpan(
                  children: [
                    TextSpan(text: "Icon(MyIcons.book,color: Colors.purple),"),
                  ]
                )),
                Text("Icon(MyIcons.wechat,color: Colors.green),"),
              ],
            ),),
            Text("],"),
          ],
        ),),
        Text(")"),
      ],
    );
  }
}