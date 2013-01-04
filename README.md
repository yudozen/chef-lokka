Description
===========
[lokka](http://lokka.org/)をインストールします。  
Apache + Passengerを使用します。

* bundler  
* sqlite-devel  
lokkaのデータストアで使用する。
* git clone  
lokkaのソースをクローンする。
* bundle install  
lokkaで使用するgemをインストールする。 
* rake db:setup  
lokkaのDBを設定する。
* httpd curl-devel httpd-devel apr-devel apr-util-devel  
Passengerで必要なパッケージをインストールする。
* passenger  
Passengerをインストールする。

