
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyLayoutRoute extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("布局类组件简介"),
        actions: [
          TextButton(onPressed: (){}, child: Text("下一页",style: TextStyle(color: Colors.white),)),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            LayoutBody(),
            LayoutBoxConstraints(),
            MyConstrainedBox(),
          ],
        ),
      ),
    );
  }
}

class LayoutBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("4.2.1 Flutter布局模型",style: TextStyle(fontWeight: FontWeight.bold),),
        Padding(padding: EdgeInsets.only(top: 16.0,left: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Flutter有两种布局模型:"),
              Text("- 基于 RenderBox 的盒模型布局"),
              Text("- 基于 Sliver(RenderSliver) 按需加载列表布局"),
              Text("两种布局方式在细节上略有差异，但大体流程相同，布局流程如下："),
              Text("1. 上层组件向下层传递约束(constraints)条件"),
              Text("2. 下层组件确定自己的大小，然后告诉上层组件。注意下层组件的大小必须符合父组件的约束"),
              Text("3.上层组件确定下层组件相对于自身的偏倚和确定自身的大小（大多数情况下会根据子组件的大小来确定自身的大小）"),
              Text("比如：父组件传递给子组件的约束是'最大宽高不能超过100，最小宽高为0',如果我们给子组件设置宽高都为200，则子组件最终的大小是100*100，因为任何时候组件都必须先遵循父组件的约束，在此基础上再应用子组件约束（相当于父组件的约束和自身的大小求一个交集）"),
              Text("本节我们主要看一下盒模型布局，然后会在可滚动组件一章中介绍 Sliver 布局模型。盒模型布局组件有两个特点："),
              Padding(padding: EdgeInsets.only(top: 16.0,left: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("1.组件对应的渲染对象都继承自 RenderBox 类（盒模型布局）"),
                    Text("2.在布局过程中父级传递给子级的约束信息有 BoxConstraints 描述"),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class LayoutBoxConstraints extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return
        Padding(padding: EdgeInsets.only(left: 16.0,top: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("4.2.2 BoxConstraints",style: TextStyle(fontWeight: FontWeight.bold),),
              Text("BoxConstraints 是盒模型布局过程中父渲染对象传递给子渲染对象的约束信息，包含最大宽高信息，子组件大小需要在约束的范围内，BoxConstraints 默认的构造函数如下："),

              Text.rich(TextSpan(
              children: [
                TextSpan(text: "const  ", style: TextStyle(color: Colors.purple)),
                TextSpan(text: "BoxConstraints ",style: TextStyle(color: Colors.deepOrange)),
                TextSpan(text: "({")
              ]
          )),
              Padding(padding: EdgeInsets.only(left: 16.0),child:
                Text.rich(TextSpan(
                  children: [
                    TextSpan(text: "this",style: TextStyle(color: Colors.purple)),
                    TextSpan(text: ".minWidth"),
                    TextSpan(text: "  =", style: TextStyle(color: Colors.grey)),
                    TextSpan(text: "  0.0,",style: TextStyle(color: Colors.deepOrange))
                  ]
                ))
               ),
              Padding(padding: EdgeInsets.only(left: 16.0),child:
              Text.rich(TextSpan(
                  children: [
                    TextSpan(text: "this",style: TextStyle(color: Colors.purple)),
                    TextSpan(text: ".maxWidth"),
                    TextSpan(text: "  =", style: TextStyle(color: Colors.grey)),
                    TextSpan(text: "  double.infinity,")
                  ]
              ))
              ),
              Padding(padding: EdgeInsets.only(left: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text.rich(TextSpan(
                      children: [
                       TextSpan(text: "this", style: TextStyle(color: Colors.purple)),
                       TextSpan(text: ".minHeight  "),
                       TextSpan(text: "=",style: TextStyle(color: Colors.green)),
                       TextSpan(text: "  0.0,",style: TextStyle(color: Colors.deepOrange)),
                      ]
                    )),
                    Text.rich(TextSpan(
                        children: [
                          TextSpan(text: "this", style: TextStyle(color: Colors.purple)),
                          TextSpan(text: ".maxHeight  "),
                          TextSpan(text: "=",style: TextStyle(color: Colors.green)),
                          TextSpan(text: "  double.infinity,"),
                        ]
                    )),
                  ],
                ),
              ),
              Text("})"),
              Text("它包含 4 个属性，BoxConstraints还定义了一些便捷的构造函数，用于快速生成特定限制规则的BoxConstraints，如BoxConstraints.tight(Size size)，它可以生成固定宽高的限制；BoxConstraints.expand()可以生成一个尽可能大的用以填充另一个容器的BoxConstraints。除此之外还有一些其他的便捷函数，读者可以查看类定义。另外我们会在后面深入介绍布局原理时还会讨论 Constraints，在这里，读者只需知道父级组件是通过 BoxConstraints 来描述对子组件可用的空间范围即可。"),
              Text("下面我们来介绍一些常用的通过约束限制子组件大小的组件"),
    ]
        ),
    );
  }
}

class MyConstrainedBox extends StatelessWidget {

  Widget reBox = DecoratedBox(
      decoration: BoxDecoration(color: Colors.black12),
    child:Padding(padding: EdgeInsets.only(left: 16.0,top: 16.0),child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text.rich(TextSpan(
          children: [
            TextSpan(text: "Widget  ",style: TextStyle(color: Colors.deepOrange)),
            TextSpan(text: "reBox"),
            TextSpan(text: "  =  ",style: TextStyle(color: Colors.green)),
            TextSpan(text: "DecoratedBox",style: TextStyle(color: Colors.deepOrange)),
            TextSpan(text: "("),
          ]
        )),
        Padding(padding: EdgeInsets.only(left: 16.0),child:
        Text.rich(TextSpan(
            children: [
              TextSpan(text: "decoration:  "),
              TextSpan(text: "BoxDecoration", style: TextStyle(color: Colors.deepOrange)),
              TextSpan(text: "(color:  "),
              TextSpan(text: "Colors",style: TextStyle(color: Colors.deepOrange)),
              TextSpan(text: ".red)"),
            ]
        )),
          ),

        Text(");"),
      ],
    ) ,),
  );
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("ConstrainedBox用于对子组件添加额外的约束。例如，如果你想让子组件的最小高度是80像素，你可以使用const BoxConstraints(minHeight: 80.0)作为子组件的约束。"),
        Text("示例",style: TextStyle(fontWeight: FontWeight.bold),),
        Text("我们先定义一个redBox，它是一个背景颜色为红色的盒子，不指定它的宽度和高度："),
        ConstrainedBox(constraints: BoxConstraints(
          minWidth: double.infinity,
          minHeight: 80.0
        ),child: Container(
          height: 5.0,
          child: reBox,
        ),),
        Text("我们实现一个最小高度为50，宽度尽可能大的红色容器"),
        ConstrainedBox(constraints: BoxConstraints(
          minWidth: double.infinity,
          minHeight: 100.0
        ),
          child: DecoratedBox(decoration: BoxDecoration(color: Colors.black12),
            child: Padding(padding: EdgeInsets.only(left: 16.0,top: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text.rich(TextSpan(
                    children: [
                      TextSpan(text: "ConstrainedBox",style: TextStyle(color: Colors.deepOrange)),
                      TextSpan(text: "(")
                    ]
                  )),
                  Padding(padding: EdgeInsets.only(left: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text.rich(TextSpan(
                          children: [
                            TextSpan(text: "constraints:  "),
                            TextSpan(text: "BoxConstraints",style: TextStyle(color: Colors.deepOrange)),
                            TextSpan(text: "("),
                          ]
                        )),
                        Padding(padding: EdgeInsets.only(left: 16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text.rich(TextSpan(
                                children: [
                                  TextSpan(text: "minWidth:  double.infinity,"),
                                ]
                              )),
                              Text.rich(TextSpan(
                                  children: [
                                    TextSpan(text: "minHeight:  "),
                                    TextSpan(text: "50.0",style: TextStyle(color: Colors.deepOrange)),
                                  ]
                              )),
                            ],
                          ),
                        ),
                        Text(("),")),
                        Text.rich(TextSpan(
                            children: [
                              TextSpan(text: "child:  "),
                              TextSpan(text: "Container",style: TextStyle(color: Colors.deepOrange)),
                              TextSpan(text: "("),
                            ]
                        )),
                        Padding(padding: EdgeInsets.only(left: 16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text.rich(TextSpan(
                                children: [
                                  TextSpan(text: "height:"),
                                  TextSpan(text: "50.0,",style: TextStyle(color: Colors.deepOrange)),
                                ]
                              )),
                              Text.rich(TextSpan(
                                  children: [
                                    TextSpan(text: "child:  redBox ,"),
                                  ]
                              )),
                            ],
                          ),
                        ),
                        Text(("),")),
                      ],
                    ),
                  ),
                  Text(")"),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}


