// Start from Slide 66 
//Slide #71
console.log("***************************************************"); 
console.log("Loop scoping and fresh iterations"); 
let vals	=	[];
for (var 	x	=	0;	x<	4;	x+=	1)	{ vals.push(()	=>	x);}
console.log("Using vars: " + vals.map(x	=>	x()));
vals = []; 
for (let 	x	=	0;	x<	4;	x+=	1)	{ vals.push(()	=>	x);}
console.log("Using lets: " + vals.map(x	=>	x()));
console.log("***************************************************"); 
console.log("Object Consts"); 
const	obj		=	{	par:	3	}; 
console.log(obj); 
try {
obj	=	4;	//	TypeError
} 
catch (Error) { 
console.log("Error when trying setting obj to value"); 
} 
obj.par = 12; 
console.log("Even though obj is constant, we can change value", obj); 
Object.freeze(obj); 
obj.par=15; 
console.log("Even though obj is now frozen, we can try to change value, but it wont ", obj); 
Object.seal(obj); 
obj.par2=15; 
console.log("Now obj is frozen & sealed, we can try to change value or add properties , but it wont ", obj); 
function demoFreezeSeal(obj) { 
"use strict"; 
Object.freeze(obj); 
obj.par=15; 
console.log("Even though obj is now frozen, we can try to change value, but it wont ", obj); 
Object.seal(obj); 
obj.par2=15; 
console.log("Now obj is frozen & sealed, we can try to change value or add properties , but it wont ", obj); 
} 
try { 
 demoFreezeSeal(obj); 
} 
catch (Error) {
	console.log("Error will be thrown in strict mode: ", Error); 
} 
console.log("***************************************************"); 
console.log("String Templates"); 
var myname = "Seshagiri Sriram" ; 
console.log("Using String Templates: ", `${myname}`); 
console.log("***************************************************"); 
console.log("Enhanced Object Literals and fns inside Object Literals");
let quadEq = []; 
for(let x = 1; x   <= 20; x++) {
	quadEq.push (({x, y:2*x*x-5*x+3}));  	
}
let	foo=	{ 
	f(x)	{
		return	x	+	1;
	}
};
console.log("foo.f(4) - inside fn of object literal -> ",foo.f(4)); 
console.log(quadEq); 
console.log("***************************************************"); 
console.log("My Fav Subject --> overriding and overloading");
class A { 
   toString() { 
     return "In Class A"; 
   }
} 
class B extends A { 
  toString() { 
    return "In class B with call to super: " + super.toString(); 
  } 
} 
var BObj = new B(); 
console.log(BObj.toString()); 
console.log("BOBJ --> "+BObj.__proto__); 
console.log("B--> extended from --> "+B.prototype); 
console.log("A--> extended from --> "+A.prototype); 
console.log("B--> extended from --> "+B.prototype.__proto__); 
console.log("A--> extended from --> "+A.prototype.__proto__); 
function myFunc() {}
const originalToString = Function.prototype.toString;
myFunc.toString = function() {
  return "Custom: " + originalToString.call(this);
};
console.log("function myFunc toString() - not class :" + myFunc.toString());
console.log("***************************************************"); 
console.log("Symbols");
const js_obj = { 
   name: "Sriram", age:60, salary: 100, 
   /*[Symbol.toPrimitive](hint) {
   if(hint=="string"    ) return "Hint: Guess Over 50";
   if(hint=="number") return 58; 
   if(hint=="default" ) return "somewhere between 50 and 60";
   }*/
   [Symbol.toPrimitive](hint) {
   if(hint=="number") { return this.age} 
   if(hint=="default" || hint=="string") return JSON.stringify(this);
   }
   
   
} 
/*console.log(`${js_obj}`);
console.log("Age Guess again  : " ,(js_obj+''));  
console.log("Age Guess: Final Guess About :"+  (+js_obj));
*/
console.log("STRING: " + `${js_obj}`);
console.log("DEFAULT  : " ,(js_obj+''));  
console.log("NUMBER :"+  (+js_obj));

console.log("Since you gave up: ", js_obj);
console.log("***************************************************"); 
console.log("Classes and Inheritance");
class	Jedi	{ 
    constructor(str)	{
	this.forceIsDark	=	false;this.jediname = str; 
}
 get name()  { 
	return this.jediname ; 
}
set name(str) {
	this.jediname = str
}	
       toString()	{
		if(this.forceIsDark) return `${this.jediname}`+": Join the dark side"; 
		return	`${this.jediname}`+": Fear is the path to the dark side"; 
	}
}
class Sith	extends	Jedi	{ 
	constructor(str)	{
		super(str); this.forceIsDark	=	true; this.jediname = str; 
	}
}
let	yoda	=	new	Jedi("Yoda"); //yoda.name = "Yoda"; 
let	darth	=	new	Sith("Darth Vader"); //darth.name = "Darth Vader"; 
console.log(yoda.toString());
console.log(darth.toString());
console.log(darth.name, "is a Sith ?" , darth instanceof Sith);
console.log(darth.name, "is a Jedi ?", darth instanceof Jedi);

console.log(yoda.name, "is a Sith ?" , yoda instanceof Sith);
console.log(yoda.name, "is a Jedi ?", yoda instanceof Jedi);
console.log("***************************************************"); 
console.log("THE FOR LOOPS");
//Slide #93
var	arr =['a','b','c']; 
console.log("*** ---> The bad in loop "); 
for (var i	in	arr)	{if	(arr.hasOwnProperty(i))	{ console.log(i);}}
console.log("*** ---> The good of loop "); 
for (var i	of 	arr)	{ console.log(i);}
console.log("*** ---> The better foreach loop "); 
arr.forEach(x=>console.log(x)); 
const ratings = [5, 4, 5];
let sum = 0;
const asyncSumFunction = async (a, b) => a + b;
const syncSumFunction = (a, b) => a + b;
ratings.forEach(async (rating) => {
  sum = await asyncSumFunction(sum, rating);
});
console.log("BAD async bummer : " + sum);
sum=0; 
ratings.forEach((rating) => {
  sum = syncSumFunction(sum, rating);
});
console.log("Nice sync clean sum : " + sum);
const logArrayElements = (element, index /*, array */) => {
  console.log(`a[${index}] = ${element}`);
};
[2, 5, , 9].forEach(logArrayElements);
console.log("Using Spreads/Rests: "+[..."abcd"]); 
var a = [..."abcd"];
console.log("isArray A? : "+ Array.isArray(a)); 
var [a,b] = "xy"; 
console.log("Destructuring: " + `${a}, ${b}`); 
console.log("Arrays from : " + `Array.from("12345"): `
+`${Array.from("12345")}`); 
console.log("***************************************************"); 
console.log("Iterators.....");
let it = [1,2,3][Symbol.iterator](); 
let result = it.next(); 
while (result.done!==true) { 
	console.log(" iterator value: " + result.value+ ", Done status: " + result.done); 
	result = it.next(); 
} 
function somecode(n) { 
	return { 
			[Symbol.iterator]() { 
				let i = 0; 
				return {
						next() {
								return {
										done: i>n?true:false, 
										 value: i++
								}; 
						}
				};
			} 
	} ;
} 
for (let i of  somecode(10)) 
	console.log("Some code obfuscated : " + i); 
console.log("***************************************************"); 
console.log("Arrays..Yet Again...");
let	arrayLike	=	{ 0:'zero', 1:	'one', 2:	'two',	3:	'three','length'	:	4 };
console.log(Array.from(arrayLike));
//console.log("Lets Generate a table of squares for 1st 20 numbers"); 
console.log(Array.from(somecode(20), x=>x*x));
console.log("And creating an array using of: "+ Array.of(1,3,4,6)); 
console.log("***************************************************"); 
console.log("Iterable keys and values"); 
let objarrit = ['a','b','c'].keys();
console.log("Iterators or arrays: " + objarrit); 
result=objarrit.next(); 
while(!result.done) { 
	console.log(result.value); 
	result=objarrit.next(); 
} 
let objarr  = [...['a','b','c'].keys()]
console.log(objarr); 
objarrit = Array.from(['a','b','c'].entries());
console.log(objarrit); 
console.log("***************************************************"); 
console.log("Objects, Maps and Sets"); 
let objAssign = {a:1}; 
Object.assign(objAssign, {b:2}) ; 
console.log(objAssign); 
var	m	=	new	Map( [ [1,	'first'], [{},	'second'] ]);
m.set(x=>	x+1,	'third').set({},	'fourth');
var	key	=	{};
console.log(" get Key: " + m.get(key));		
//m.has({});	//	false 
//m.delete(key);	//	true 
//m.size;	//	1 m.clear();
//m.size;	//	0
m.forEach((val,	key)	=>	{	console.log("Key: " + key + ", Val: " + val);});
console.log("AS JSON Full: " + JSON.stringify([...m])); 
console.log("AS JSON Keys: " + JSON.stringify([...m.keys()])); 
console.log("AS JSON Values: " + JSON.stringify([...m.values()])); 
console.log("AS JSON Entries: " + JSON.stringify([...m.entries()]));
console.log("***************************************************"); 
console.log("Generators"); 
function*	genFour()	{ 
yield	1;
yield	2;
yield	3;
return	4;
}
let	four	=	genFour();
console.log("Four = using function* = " + four); 
result = four.next(); 
while(!result.done) { 
console.log("From 4Gen Iterator: "+ result.value); 
result = four.next(); 
}
// Print the final return value
console.log("Final return value: " + result.value);
console.log("******* The above is done because return sets value as well as done "); 
function*	flatten(arr)	{
for	(let	x	of	arr)	{
	if	(x	instanceof	Array)	{ yield*	flatten(x);
}	else	{ yield		x;
}
}
}
let	t	=	flatten([1,	2,	[3,	4]]);
console.log("Flattened: " +t); 
result = t.next(); 
while(!result.done) { 
console.log("From Yield or delegation operator: "+ result.value); 
result = t.next(); 
}
function* inner() {
  yield 'a';
  yield 'b';
}
function* outer() {
  yield 1;
  yield* inner(); // delegates to inner generator
  yield 2;
}
for (const val of outer()) {
  console.log("Delegating Yield => " + val);
}
// Output: 1, 'a', 'b', 2
console.log("***************************************************"); 
console.log("Arrow Functions"); 
function TimerV1() { 
const self=this; 
setInterval(function () {
		console.log(self); 
},1000);
} 
function TimerV2() {
  setInterval(function () {
    console.log(this); // refers to Timer instance
  }.bind(this), 1000);
}
function TimerV3() {
  setInterval(() => {
    console.log(this); // refers to Timer instance
  }, 1000);
}
console.log("***** See Application --> clock.html"); 
let	inc	=		()	=>	{ return		7;}
console.log("Arrow fn==>"+inc()); 
console.log("***************************************************"); 
console.log("Misc. Functions"); 
let	reverse	=	([x,	...y])	=>
(y.length	>	0)?[...reverse(y),	x]:[x];
console.log(reverse([1,2,3,4,5,6]));
let	[,,	...y]	=	[1,2,3,4,5];
console.log(y);	//	Array	[3,	4,	5]
function*	squares(n)	{
for	(let		i	=	1;	i	<	n;	i	+=	1)	{ yield	Math.pow(i,2);
}
}
console.log([...squares(6)]); 
console.log("Int array reverse...:"+ reverse([1,2,3,4])); 
console.log("String reverse...:"+ reverse("sriram")); 
console.log("fn result reverse...:"+ reverse([...squares(10)]));
console.log("Reverse of a number: " + reverse(57+"")); 