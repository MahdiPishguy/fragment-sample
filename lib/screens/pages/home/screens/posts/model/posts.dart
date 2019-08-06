import 'package:json_annotation/json_annotation.dart';

@JsonSerializable(nullable: false)
class PostsModel {
  List<Posts> posts;
}

class Posts {
  @JsonKey(name: 'id')
  int id;
  @JsonKey(name: 'rendered')
  String rendered; //link "http://localhost/wordpress/?p=1"
  @JsonKey(name: 'link')
  String link; //link "http://localhost/wordpress/2019/08/06/%d8%b3%d9%84%d8%a7%d9%85-%d8%af%d9%86%db%8c%d8%a7/"
  @JsonKey(name: 'title')
  Title title;
  @JsonKey(name: 'content')
  Content content;
  @JsonKey(name: 'wp:term')
  WpTerm wpTerm;
}

class Title {
  @JsonKey(name: 'rendered')
  String rendered; //"rendered": "سلام دنیا!"
}

class Content {
  @JsonKey(name: 'content')
  String content; //"\n<p>به وردپرس خوش آمدید. این اولین نوشته‌ی شماست. این را ویرایش یا حذف کنید، سپس نوشتن را شروع نمایید!</p>\n",
}
class WpTerm{
  List<WpTermData> data;
}

class WpTermData{
  @JsonKey(name:'link')
  String link;
  @JsonKey(name:'name')
  String name;
}

/*
"_embedded": {
"author": [
{
"id": 1,
"name": "admin",
"url": "",
"description": "",
"link": "http://localhost/wordpress/author/admin/",
"slug": "admin",
"avatar_urls": {
"24": "http://2.gravatar.com/avatar/b752d28d25ecec40e68603b546ef4d7e?s=24&d=mm&r=g",
"48": "http://2.gravatar.com/avatar/b752d28d25ecec40e68603b546ef4d7e?s=48&d=mm&r=g",
"96": "http://2.gravatar.com/avatar/b752d28d25ecec40e68603b546ef4d7e?s=96&d=mm&r=g"
},
"_links": {
"self": [
{
"href": "http://localhost/wordpress/wp-json/wp/v2/users/1"
}
],
"collection": [
{
"href": "http://localhost/wordpress/wp-json/wp/v2/users"
}
]
}
}
],
*/


/*
"wp:term": [
[
{
"id": 1,
"link": "http://localhost/wordpress/category/%d8%af%d8%b3%d8%aa%d9%87%e2%80%8c%d8%a8%d9%86%d8%af%db%8c-%d9%86%d8%b4%d8%af%d9%87/",
"name": "دسته‌بندی نشده",
"slug": "%d8%af%d8%b3%d8%aa%d9%87%e2%80%8c%d8%a8%d9%86%d8%af%db%8c-%d9%86%d8%b4%d8%af%d9%87",
"taxonomy": "category",
"_links": {
"self": [
{
"href": "http://localhost/wordpress/wp-json/wp/v2/categories/1"
}
],
"collection": [
{
"href": "http://localhost/wordpress/wp-json/wp/v2/categories"
}
],
"about": [
{
"href": "http://localhost/wordpress/wp-json/wp/v2/taxonomies/category"
}
],
"wp:post_type": [
{
"href": "http://localhost/wordpress/wp-json/wp/v2/posts?categories=1"
}
],
"curies": [
{
"name": "wp",
"href": "https://api.w.org/{rel}",
"templated": true
}
]
}
}
],
[]
]
}
}
]*/
