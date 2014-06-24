/// NOTE: temporary solution for #203:
/// https://bitbucket.org/IntelliFactory/websharper/issue/203/dom-identification-in-websharper
declare module IntelliFactory.WebSharper {

    export module DomUtil {
        interface _Attr extends Attr { }
        interface _Element extends Element { }
        interface _Node extends Node { }
        interface _Text extends Text { }
    }

    export module Dom {
        import U = DomUtil;
        interface Attr extends U._Attr { }
        interface Element extends U._Element { }
        interface Node extends U._Node { }
        interface Text extends U._Text { }
    }
}

declare module IntelliFactory {
    module WebSharper {
        module Arrays {
            var reverse : {
                (array: __ABBREV.__WebSharper.ArrayProxy, offset: number, length: number): void;
            };
            var checkRange : {
                <_M1>(arr: _M1[], start: number, size: number): void;
            };
            var checkLength : {
                <_M1, _M2>(arr1: _M1[], arr2: _M2[]): void;
            };
            var average : {
                <_M1>(arr: _M1[]): _M1;
            };
            var averageBy : {
                <_M1, _M2>(f: {
                    (x: _M1): _M2;
                }, arr: _M1[]): _M2;
            };
            var blit : {
                <_M1>(arr1: _M1[], start1: number, arr2: _M1[], start2: number, length: number): void;
            };
            var choose : {
                <_M1, _M2>(f: {
                    (x: _M1): __ABBREV.__WebSharper.OptionProxy<_M2>;
                }, arr: _M1[]): _M2[];
            };
            var collect : {
                <_M1, _M2>(f: {
                    (x: _M1): _M2[];
                }, x: _M1[]): _M2[];
            };
            var concat : {
                <_M1>(xs: __ABBREV.__WebSharper.seq<_M1[]>): _M1[];
            };
            var create : {
                <_M1>(size: number, value: _M1): _M1[];
            };
            var exists2 : {
                <_M1, _M2>(f: {
                    (x: _M1): {
                        (x: _M2): boolean;
                    };
                }, arr1: _M1[], arr2: _M2[]): boolean;
            };
            var fill : {
                <_M1>(arr: _M1[], start: number, length: number, value: _M1): void;
            };
            var filter : {
                <_M1>(f: {
                    (x: _M1): boolean;
                }, arr: _M1[]): _M1[];
            };
            var Find : {
                <_M1>(f: {
                    (x: _M1): boolean;
                }, arr: _M1[]): _M1;
            };
            var FindIndex : {
                <_M1>(f: {
                    (x: _M1): boolean;
                }, arr: _M1[]): number;
            };
            var fold : {
                <_M1, _M2>(f: {
                    (x: _M2): {
                        (x: _M1): _M2;
                    };
                }, zero: _M2, arr: _M1[]): _M2;
            };
            var fold2 : {
                <_M1, _M2, _M3>(f: {
                    (x: _M3): {
                        (x: _M1): {
                            (x: _M2): _M3;
                        };
                    };
                }, zero: _M3, arr1: _M1[], arr2: _M2[]): _M3;
            };
            var foldBack : {
                <_M1, _M2>(f: {
                    (x: _M1): {
                        (x: _M2): _M2;
                    };
                }, arr: _M1[], zero: _M2): _M2;
            };
            var foldBack2 : {
                <_M1, _M2, _M3>(f: {
                    (x: _M1): {
                        (x: _M2): {
                            (x: _M3): _M3;
                        };
                    };
                }, arr1: _M1[], arr2: _M2[], zero: _M3): _M3;
            };
            var forall2 : {
                <_M1, _M2>(f: {
                    (x: _M1): {
                        (x: _M2): boolean;
                    };
                }, arr1: _M1[], arr2: _M2[]): boolean;
            };
            var init : {
                <_M1>(size: number, f: {
                    (x: number): _M1;
                }): _M1[];
            };
            var iter : {
                <_M1>(f: {
                    (x: _M1): void;
                }, arr: _M1[]): void;
            };
            var iter2 : {
                <_M1, _M2>(f: {
                    (x: _M1): {
                        (x: _M2): void;
                    };
                }, arr1: _M1[], arr2: _M2[]): void;
            };
            var iteri : {
                <_M1>(f: {
                    (x: number): {
                        (x: _M1): void;
                    };
                }, arr: _M1[]): void;
            };
            var iteri2 : {
                <_M1, _M2>(f: {
                    (x: number): {
                        (x: _M1): {
                            (x: _M2): void;
                        };
                    };
                }, arr1: _M1[], arr2: _M2[]): void;
            };
            var map : {
                <_M1, _M2>(f: {
                    (x: _M1): _M2;
                }, arr: _M1[]): _M2[];
            };
            var map2 : {
                <_M1, _M2, _M3>(f: {
                    (x: _M1): {
                        (x: _M2): _M3;
                    };
                }, arr1: _M1[], arr2: _M2[]): _M3[];
            };
            var mapi : {
                <_M1, _M2>(f: {
                    (x: number): {
                        (x: _M1): _M2;
                    };
                }, arr: _M1[]): _M2[];
            };
            var mapi2 : {
                <_M1, _M2, _M3>(f: {
                    (x: number): {
                        (x: _M1): {
                            (x: _M2): _M3;
                        };
                    };
                }, arr1: _M1[], arr2: _M2[]): _M3[];
            };
            var max : {
                <_M1>(x: _M1[]): _M1;
            };
            var maxBy : {
                <_M1, _M2>(f: {
                    (x: _M1): _M2;
                }, arr: _M1[]): _M1;
            };
            var min : {
                <_M1>(x: _M1[]): _M1;
            };
            var minBy : {
                <_M1, _M2>(f: {
                    (x: _M1): _M2;
                }, arr: _M1[]): _M1;
            };
            var ofSeq : {
                <_M1>(xs: __ABBREV.__WebSharper.seq<_M1>): _M1[];
            };
            var partition : {
                <_M1>(f: {
                    (x: _M1): boolean;
                }, arr: _M1[]): any;
            };
            var permute : {
                <_M1>(f: {
                    (x: number): number;
                }, arr: _M1[]): _M1[];
            };
            var Pick : {
                <_M1, _M2>(f: {
                    (x: _M1): __ABBREV.__WebSharper.OptionProxy<_M2>;
                }, arr: _M1[]): _M2;
            };
            var nonEmpty : {
                <_M1>(arr: _M1[]): void;
            };
            var reduce : {
                <_M1>(f: {
                    (x: _M1): {
                        (x: _M1): _M1;
                    };
                }, arr: _M1[]): _M1;
            };
            var reduceBack : {
                <_M1>(f: {
                    (x: _M1): {
                        (x: _M1): _M1;
                    };
                }, arr: _M1[]): _M1;
            };
            var scan : {
                <_M1, _M2>(f: {
                    (x: _M2): {
                        (x: _M1): _M2;
                    };
                }, zero: _M2, arr: _M1[]): _M2[];
            };
            var scanBack : {
                <_M1, _M2>(f: {
                    (x: _M1): {
                        (x: _M2): _M2;
                    };
                }, arr: _M1[], zero: _M2): _M2[];
            };
            var sort : {
                <_M1>(arr: _M1[]): _M1[];
            };
            var sortBy : {
                <_M1, _M2>(f: {
                    (x: _M1): _M2;
                }, arr: _M1[]): _M1[];
            };
            var sortInPlace : {
                <_M1>(arr: _M1[]): void;
            };
            var sortInPlaceBy : {
                <_M1, _M2>(f: {
                    (x: _M1): _M2;
                }, arr: _M1[]): void;
            };
            var sortInPlaceWith : {
                <_M1>(comparer: {
                    (x: _M1): {
                        (x: _M1): number;
                    };
                }, arr: _M1[]): void;
            };
            var sortWith : {
                <_M1>(comparer: {
                    (x: _M1): {
                        (x: _M1): number;
                    };
                }, arr: _M1[]): _M1[];
            };
            var sub : {
                <_M1>(arr: _M1[], start: number, length: number): _M1[];
            };
            var tryFind : {
                <_M1>(f: {
                    (x: _M1): boolean;
                }, arr: _M1[]): __ABBREV.__WebSharper.OptionProxy<_M1>;
            };
            var tryFindIndex : {
                <_M1>(f: {
                    (x: _M1): boolean;
                }, arr: _M1[]): __ABBREV.__WebSharper.OptionProxy<number>;
            };
            var tryPick : {
                <_M1, _M2>(f: {
                    (x: _M1): __ABBREV.__WebSharper.OptionProxy<_M2>;
                }, arr: _M1[]): __ABBREV.__WebSharper.OptionProxy<_M2>;
            };
            var unzip : {
                <_M1, _M2>(arr: any[]): any;
            };
            var unzip3 : {
                <_M1, _M2, _M3>(arr: any[]): any;
            };
            var zip : {
                <_M1, _M2>(arr1: _M1[], arr2: _M2[]): any[];
            };
            var zip3 : {
                <_M1, _M2, _M3>(arr1: _M1[], arr2: _M2[], arr3: _M3[]): any[];
            };
        }
        module Char {
            var GetNumericValue : {
                (c: number): number;
            };
            var IsControl : {
                (c: number): boolean;
            };
            var IsDigit : {
                (c: number): boolean;
            };
            var IsLetter : {
                (c: number): boolean;
            };
            var IsLetterOrDigit : {
                (c: number): boolean;
            };
            var IsLower : {
                (c: number): boolean;
            };
            var IsUpper : {
                (c: number): boolean;
            };
        }
        module List {
            module T {
                var Construct : {
                    (head: any, tail: __ABBREV.__List.T<any>): __ABBREV.__List.T<any>;
                };
                var get_Nil : {
                    (): __ABBREV.__List.T<any>;
                };
            }
            interface T<_T1> {
                GetEnumerator(): __ABBREV.__WebSharper.IEnumeratorProxy<_T1>;
                get_Length(): number;
                get_Item(x: number): _T1;
            }
            var append : {
                <_M1>(x: __ABBREV.__List.T<_M1>, y: __ABBREV.__List.T<_M1>): __ABBREV.__List.T<_M1>;
            };
            var choose : {
                <_M1, _M2>(f: {
                    (x: _M1): __ABBREV.__WebSharper.OptionProxy<_M2>;
                }, l: __ABBREV.__List.T<_M1>): __ABBREV.__List.T<_M2>;
            };
            var collect : {
                <_M1, _M2>(f: {
                    (x: _M1): __ABBREV.__List.T<_M2>;
                }, l: __ABBREV.__List.T<_M1>): __ABBREV.__List.T<_M2>;
            };
            var concat : {
                <_M1>(s: __ABBREV.__WebSharper.seq<__ABBREV.__List.T<_M1>>): __ABBREV.__List.T<_M1>;
            };
            var exists2 : {
                <_M1, _M2>(p: {
                    (x: _M1): {
                        (x: _M2): boolean;
                    };
                }, l1: __ABBREV.__List.T<_M1>, l2: __ABBREV.__List.T<_M2>): boolean;
            };
            var filter : {
                <_M1>(p: {
                    (x: _M1): boolean;
                }, l: __ABBREV.__List.T<_M1>): __ABBREV.__List.T<_M1>;
            };
            var fold2 : {
                <_M1, _M2, _M3>(f: {
                    (x: _M3): {
                        (x: _M1): {
                            (x: _M2): _M3;
                        };
                    };
                }, s: _M3, l1: __ABBREV.__List.T<_M1>, l2: __ABBREV.__List.T<_M2>): _M3;
            };
            var foldBack : {
                <_M1, _M2>(f: {
                    (x: _M1): {
                        (x: _M2): _M2;
                    };
                }, l: __ABBREV.__List.T<_M1>, s: _M2): _M2;
            };
            var foldBack2 : {
                <_M1, _M2, _M3>(f: {
                    (x: _M1): {
                        (x: _M2): {
                            (x: _M3): _M3;
                        };
                    };
                }, l1: __ABBREV.__List.T<_M1>, l2: __ABBREV.__List.T<_M2>, s: _M3): _M3;
            };
            var forall2 : {
                <_M1, _M2>(p: {
                    (x: _M1): {
                        (x: _M2): boolean;
                    };
                }, l1: __ABBREV.__List.T<_M1>, l2: __ABBREV.__List.T<_M2>): boolean;
            };
            var init : {
                <_M1>(s: number, f: {
                    (x: number): _M1;
                }): __ABBREV.__List.T<_M1>;
            };
            var iter2 : {
                <_M1, _M2>(f: {
                    (x: _M1): {
                        (x: _M2): void;
                    };
                }, l1: __ABBREV.__List.T<_M1>, l2: __ABBREV.__List.T<_M2>): void;
            };
            var iteri2 : {
                <_M1, _M2>(f: {
                    (x: number): {
                        (x: _M1): {
                            (x: _M2): void;
                        };
                    };
                }, l1: __ABBREV.__List.T<_M1>, l2: __ABBREV.__List.T<_M2>): void;
            };
            var map : {
                <_M1, _M2>(f: {
                    (x: _M1): _M2;
                }, l: __ABBREV.__List.T<_M1>): __ABBREV.__List.T<_M2>;
            };
            var map2 : {
                <_M1, _M2, _M3>(f: {
                    (x: _M1): {
                        (x: _M2): _M3;
                    };
                }, l1: __ABBREV.__List.T<_M1>, l2: __ABBREV.__List.T<_M2>): __ABBREV.__List.T<_M3>;
            };
            var map3 : {
                <_M1, _M2, _M3, _M4>(f: {
                    (x: _M1): {
                        (x: _M2): {
                            (x: _M3): _M4;
                        };
                    };
                }, l1: __ABBREV.__List.T<_M1>, l2: __ABBREV.__List.T<_M2>, l3: __ABBREV.__List.T<_M3>): __ABBREV.__List.T<_M4>;
            };
            var mapi : {
                <_M1, _M2>(f: {
                    (x: number): {
                        (x: _M1): _M2;
                    };
                }, l: __ABBREV.__List.T<_M1>): __ABBREV.__List.T<_M2>;
            };
            var mapi2 : {
                <_M1, _M2, _M3>(f: {
                    (x: number): {
                        (x: _M1): {
                            (x: _M2): _M3;
                        };
                    };
                }, l1: __ABBREV.__List.T<_M1>, l2: __ABBREV.__List.T<_M2>): __ABBREV.__List.T<_M3>;
            };
            var max : {
                <_M1>(l: __ABBREV.__List.T<_M1>): _M1;
            };
            var maxBy : {
                <_M1, _M2>(f: {
                    (x: _M1): _M2;
                }, l: __ABBREV.__List.T<_M1>): _M1;
            };
            var min : {
                <_M1>(l: __ABBREV.__List.T<_M1>): _M1;
            };
            var minBy : {
                <_M1, _M2>(f: {
                    (x: _M1): _M2;
                }, l: __ABBREV.__List.T<_M1>): _M1;
            };
            var ofArray : {
                <_M1>(arr: _M1[]): __ABBREV.__List.T<_M1>;
            };
            var ofSeq : {
                <_M1, _M2>(s: __ABBREV.__WebSharper.seq<_M1>): __ABBREV.__List.T<_M2>;
            };
            var partition : {
                <_M1>(p: {
                    (x: _M1): boolean;
                }, l: __ABBREV.__List.T<_M1>): any;
            };
            var permute : {
                <_M1>(f: {
                    (x: number): number;
                }, l: __ABBREV.__List.T<_M1>): __ABBREV.__List.T<_M1>;
            };
            var reduceBack : {
                <_M1>(f: {
                    (x: _M1): {
                        (x: _M1): _M1;
                    };
                }, l: __ABBREV.__List.T<_M1>): _M1;
            };
            var replicate : {
                <_M1>(size: number, value: _M1): __ABBREV.__List.T<_M1>;
            };
            var rev : {
                <_M1>(l: __ABBREV.__List.T<_M1>): __ABBREV.__List.T<_M1>;
            };
            var scan : {
                <_M1, _M2>(f: {
                    (x: _M2): {
                        (x: _M1): _M2;
                    };
                }, s: _M2, l: __ABBREV.__List.T<_M1>): __ABBREV.__List.T<_M2>;
            };
            var scanBack : {
                <_M1, _M2>(f: {
                    (x: _M1): {
                        (x: _M2): _M2;
                    };
                }, l: __ABBREV.__List.T<_M1>, s: _M2): __ABBREV.__List.T<_M2>;
            };
            var sort : {
                <_M1>(l: __ABBREV.__List.T<_M1>): __ABBREV.__List.T<_M1>;
            };
            var sortBy : {
                <_M1, _M2>(f: {
                    (x: _M1): _M2;
                }, l: __ABBREV.__List.T<_M1>): __ABBREV.__List.T<_M1>;
            };
            var sortWith : {
                <_M1>(f: {
                    (x: _M1): {
                        (x: _M1): number;
                    };
                }, l: __ABBREV.__List.T<_M1>): __ABBREV.__List.T<_M1>;
            };
            var unzip : {
                <_M1, _M2>(l: __ABBREV.__List.T<any>): any;
            };
            var unzip3 : {
                <_M1, _M2, _M3>(l: __ABBREV.__List.T<any>): any;
            };
            var zip : {
                <_M1, _M2>(l1: __ABBREV.__List.T<_M1>, l2: __ABBREV.__List.T<_M2>): __ABBREV.__List.T<any>;
            };
            var zip3 : {
                <_M1, _M2, _M3>(l1: __ABBREV.__List.T<_M1>, l2: __ABBREV.__List.T<_M2>, l3: __ABBREV.__List.T<_M3>): __ABBREV.__List.T<any>;
            };
        }
        module Unchecked {
            var compareArrays : {
                (a: __ABBREV.__WebSharper.ObjectProxy[], b: __ABBREV.__WebSharper.ObjectProxy[]): number;
            };
            var compareDates : {
                (a: __ABBREV.__WebSharper.ObjectProxy, b: __ABBREV.__WebSharper.ObjectProxy): number;
            };
            var Compare : {
                <_M1>(a: _M1, b: _M1): number;
            };
            var arrayEquals : {
                (a: __ABBREV.__WebSharper.ObjectProxy[], b: __ABBREV.__WebSharper.ObjectProxy[]): boolean;
            };
            var dateEquals : {
                <_M1, _M2>(a: _M1, b: _M2): boolean;
            };
            var Equals : {
                <_M1>(a: _M1, b: _M1): boolean;
            };
            var hashMix : {
                (x: number, y: number): number;
            };
            var hashArray : {
                (o: __ABBREV.__WebSharper.ObjectProxy[]): number;
            };
            var hashString : {
                (s: string): number;
            };
            var hashObject : {
                (o: __ABBREV.__WebSharper.ObjectProxy): number;
            };
            var Hash : {
                <_M1>(o: _M1): number;
            };
        }
        module Strings {
            interface StringProxy {
            }
            var Compare : {
                (x: string, y: string): number;
            };
            var CopyTo : {
                (s: string, o: number, d: number[], off: number, ct: number): void;
            };
            var PadLeft : {
                (s: string, n: number): string;
            };
            var PadRight : {
                (s: string, n: number): string;
            };
            var Replace : {
                (subject: string, search: string, replace: string): string;
            };
            var ReplaceChar : {
                (s: string, oldC: number, newC: number): string;
            };
            var ToCharArray : {
                (s: string): number[];
            };
            var ToCharArrayRange : {
                (s: string, startIndex: number, length: number): number[];
            };
            var Split : {
                (s: string, pat: __ABBREV.__WebSharper.ObjectProxy, opts: any): string[];
            };
            var SplitChars : {
                (s: string, sep: number[], opts: any): string[];
            };
            var SplitStrings : {
                (s: string, sep: string[], opts: any): string[];
            };
            var protect : {
                (s: string): string;
            };
            var collect : {
                (f: {
                    (x: number): string;
                }, s: string): string;
            };
            var concat : {
                (separator: string, strings: __ABBREV.__WebSharper.seq<string>): string;
            };
            var exists : {
                (f: {
                    (x: number): boolean;
                }, s: string): boolean;
            };
            var forall : {
                (f: {
                    (x: number): boolean;
                }, s: string): boolean;
            };
            var init : {
                (count: number, f: {
                    (x: number): string;
                }): string;
            };
            var iter : {
                (f: {
                    (x: number): void;
                }, s: string): void;
            };
            var iteri : {
                (f: {
                    (x: number): {
                        (x: number): void;
                    };
                }, s: string): void;
            };
            var length : {
                (s: string): number;
            };
            var map : {
                (f: {
                    (x: number): number;
                }, s: string): string;
            };
            var mapi : {
                (f: {
                    (x: number): {
                        (x: number): number;
                    };
                }, s: string): string;
            };
            var replicate : {
                (count: number, s: string): string;
            };
        }
        module Stack {
            interface StackProxy<_T1> {
            }
        }
        module Seq {
            var insufficient : {
                <_M1>(): _M1;
            };
            var append : {
                <_M1>(s1: __ABBREV.__WebSharper.seq<_M1>, s2: __ABBREV.__WebSharper.seq<_M1>): __ABBREV.__WebSharper.seq<_M1>;
            };
            var average : {
                <_M1>(s: __ABBREV.__WebSharper.seq<_M1>): _M1;
            };
            var averageBy : {
                <_M1, _M2>(f: {
                    (x: _M1): _M2;
                }, s: __ABBREV.__WebSharper.seq<_M1>): _M2;
            };
            var cache : {
                <_M1>(s: __ABBREV.__WebSharper.seq<_M1>): __ABBREV.__WebSharper.seq<_M1>;
            };
            var choose : {
                <_M1, _M2>(f: {
                    (x: _M1): __ABBREV.__WebSharper.OptionProxy<_M2>;
                }, s: __ABBREV.__WebSharper.seq<_M1>): __ABBREV.__WebSharper.seq<_M2>;
            };
            var collect : {
                <_M1, _M2, _M3>(f: {
                    (x: _M1): _M2;
                }, s: __ABBREV.__WebSharper.seq<_M1>): __ABBREV.__WebSharper.seq<_M3>;
            };
            var compareWith : {
                <_M1>(f: {
                    (x: _M1): {
                        (x: _M1): number;
                    };
                }, s1: __ABBREV.__WebSharper.seq<_M1>, s2: __ABBREV.__WebSharper.seq<_M1>): number;
            };
            var concat : {
                <_M1, _M2>(ss: __ABBREV.__WebSharper.seq<_M1>): __ABBREV.__WebSharper.seq<_M2>;
            };
            var countBy : {
                <_M1, _M2>(f: {
                    (x: _M1): _M2;
                }, s: __ABBREV.__WebSharper.seq<_M1>): __ABBREV.__WebSharper.seq<any>;
            };
            var delay : {
                <_M1>(f: {
                    (): __ABBREV.__WebSharper.seq<_M1>;
                }): __ABBREV.__WebSharper.seq<_M1>;
            };
            var distinct : {
                <_M1>(s: __ABBREV.__WebSharper.seq<_M1>): __ABBREV.__WebSharper.seq<_M1>;
            };
            var distinctBy : {
                <_M1, _M2>(f: {
                    (x: _M1): _M2;
                }, s: __ABBREV.__WebSharper.seq<_M1>): __ABBREV.__WebSharper.seq<_M1>;
            };
            var empty : {
                <_M1>(): __ABBREV.__WebSharper.seq<_M1>;
            };
            var exists : {
                <_M1, _M2>(p: {
                    (x: _M1): boolean;
                }, s: __ABBREV.__WebSharper.seq<_M2>): boolean;
            };
            var exists2 : {
                <_M1, _M2, _M3, _M4>(p: {
                    (x: _M1): {
                        (x: _M2): boolean;
                    };
                }, s1: __ABBREV.__WebSharper.seq<_M3>, s2: __ABBREV.__WebSharper.seq<_M4>): boolean;
            };
            var filter : {
                <_M1>(f: {
                    (x: _M1): boolean;
                }, s: __ABBREV.__WebSharper.seq<_M1>): __ABBREV.__WebSharper.seq<_M1>;
            };
            var find : {
                <_M1>(p: {
                    (x: _M1): boolean;
                }, s: __ABBREV.__WebSharper.seq<_M1>): _M1;
            };
            var findIndex : {
                <_M1>(p: {
                    (x: _M1): boolean;
                }, s: __ABBREV.__WebSharper.seq<_M1>): number;
            };
            var fold : {
                <_M1, _M2>(f: {
                    (x: _M2): {
                        (x: _M1): _M2;
                    };
                }, x: _M2, s: __ABBREV.__WebSharper.seq<_M1>): _M2;
            };
            var forall : {
                <_M1>(p: {
                    (x: _M1): boolean;
                }, s: __ABBREV.__WebSharper.seq<_M1>): boolean;
            };
            var forall2 : {
                <_M1, _M2>(p: {
                    (x: _M1): {
                        (x: _M2): boolean;
                    };
                }, s1: __ABBREV.__WebSharper.seq<_M1>, s2: __ABBREV.__WebSharper.seq<_M2>): boolean;
            };
            var groupBy : {
                <_M1, _M2>(f: {
                    (x: _M1): _M2;
                }, s: __ABBREV.__WebSharper.seq<_M1>): __ABBREV.__WebSharper.seq<any>;
            };
            var head : {
                <_M1>(s: __ABBREV.__WebSharper.seq<_M1>): _M1;
            };
            var init : {
                <_M1>(n: number, f: {
                    (x: number): _M1;
                }): __ABBREV.__WebSharper.seq<_M1>;
            };
            var initInfinite : {
                <_M1>(f: {
                    (x: number): _M1;
                }): __ABBREV.__WebSharper.seq<_M1>;
            };
            var isEmpty : {
                <_M1>(s: __ABBREV.__WebSharper.seq<_M1>): boolean;
            };
            var iter : {
                <_M1>(p: {
                    (x: _M1): void;
                }, s: __ABBREV.__WebSharper.seq<_M1>): void;
            };
            var iter2 : {
                <_M1, _M2, _M3, _M4>(p: {
                    (x: _M1): {
                        (x: _M2): void;
                    };
                }, s1: __ABBREV.__WebSharper.seq<_M3>, s2: __ABBREV.__WebSharper.seq<_M4>): void;
            };
            var iteri : {
                <_M1, _M2>(p: {
                    (x: number): {
                        (x: _M1): void;
                    };
                }, s: __ABBREV.__WebSharper.seq<_M2>): void;
            };
            var length : {
                <_M1>(s: __ABBREV.__WebSharper.seq<_M1>): number;
            };
            var map : {
                <_M1, _M2>(f: {
                    (x: _M1): _M2;
                }, s: __ABBREV.__WebSharper.seq<_M1>): __ABBREV.__WebSharper.seq<_M2>;
            };
            var mapi : {
                <_M1, _M2>(f: {
                    (x: number): {
                        (x: _M1): _M2;
                    };
                }, s: __ABBREV.__WebSharper.seq<_M1>): __ABBREV.__WebSharper.seq<_M2>;
            };
            var mapi2 : {
                <_M1, _M2, _M3>(f: {
                    (x: _M1): {
                        (x: _M2): _M3;
                    };
                }, s1: __ABBREV.__WebSharper.seq<_M1>, s2: __ABBREV.__WebSharper.seq<_M2>): __ABBREV.__WebSharper.seq<_M3>;
            };
            var maxBy : {
                <_M1, _M2>(f: {
                    (x: _M1): _M2;
                }, s: __ABBREV.__WebSharper.seq<_M1>): _M1;
            };
            var minBy : {
                <_M1, _M2>(f: {
                    (x: _M1): _M2;
                }, s: __ABBREV.__WebSharper.seq<_M1>): _M1;
            };
            var max : {
                <_M1>(s: __ABBREV.__WebSharper.seq<_M1>): _M1;
            };
            var min : {
                <_M1>(s: __ABBREV.__WebSharper.seq<_M1>): _M1;
            };
            var nth : {
                <_M1, _M2>(index: number, s: __ABBREV.__WebSharper.seq<_M1>): _M2;
            };
            var pairwise : {
                <_M1>(s: __ABBREV.__WebSharper.seq<_M1>): __ABBREV.__WebSharper.seq<any>;
            };
            var pick : {
                <_M1, _M2>(p: {
                    (x: _M1): __ABBREV.__WebSharper.OptionProxy<_M2>;
                }, s: __ABBREV.__WebSharper.seq<_M1>): _M2;
            };
            var readOnly : {
                <_M1>(s: __ABBREV.__WebSharper.seq<_M1>): __ABBREV.__WebSharper.seq<_M1>;
            };
            var reduce : {
                <_M1>(f: {
                    (x: _M1): {
                        (x: _M1): _M1;
                    };
                }, source: __ABBREV.__WebSharper.seq<_M1>): _M1;
            };
            var scan : {
                <_M1, _M2>(f: {
                    (x: _M2): {
                        (x: _M1): _M2;
                    };
                }, x: _M2, s: __ABBREV.__WebSharper.seq<_M1>): __ABBREV.__WebSharper.seq<_M2>;
            };
            var skip : {
                <_M1>(n: number, s: __ABBREV.__WebSharper.seq<_M1>): __ABBREV.__WebSharper.seq<_M1>;
            };
            var skipWhile : {
                <_M1>(f: {
                    (x: _M1): boolean;
                }, s: __ABBREV.__WebSharper.seq<_M1>): __ABBREV.__WebSharper.seq<_M1>;
            };
            var sort : {
                <_M1>(s: __ABBREV.__WebSharper.seq<_M1>): __ABBREV.__WebSharper.seq<_M1>;
            };
            var sortBy : {
                <_M1, _M2>(f: {
                    (x: _M1): _M2;
                }, s: __ABBREV.__WebSharper.seq<_M1>): __ABBREV.__WebSharper.seq<_M1>;
            };
            var sum : {
                <_M1>(s: __ABBREV.__WebSharper.seq<_M1>): _M1;
            };
            var sumBy : {
                <_M1, _M2>(f: {
                    (x: _M1): _M2;
                }, s: __ABBREV.__WebSharper.seq<_M1>): _M2;
            };
            var take : {
                <_M1>(n: number, s: __ABBREV.__WebSharper.seq<_M1>): __ABBREV.__WebSharper.seq<_M1>;
            };
            var takeWhile : {
                <_M1>(f: {
                    (x: _M1): boolean;
                }, s: __ABBREV.__WebSharper.seq<_M1>): __ABBREV.__WebSharper.seq<_M1>;
            };
            var toArray : {
                <_M1>(s: __ABBREV.__WebSharper.seq<_M1>): _M1[];
            };
            var toList : {
                <_M1>(s: __ABBREV.__WebSharper.seq<_M1>): __ABBREV.__List.T<_M1>;
            };
            var truncate : {
                <_M1>(n: number, s: __ABBREV.__WebSharper.seq<_M1>): __ABBREV.__WebSharper.seq<_M1>;
            };
            var tryFind : {
                <_M1, _M2>(ok: {
                    (x: _M1): boolean;
                }, s: __ABBREV.__WebSharper.seq<_M2>): __ABBREV.__WebSharper.OptionProxy<_M1>;
            };
            var tryFindIndex : {
                <_M1, _M2>(ok: {
                    (x: _M1): boolean;
                }, s: __ABBREV.__WebSharper.seq<_M2>): __ABBREV.__WebSharper.OptionProxy<number>;
            };
            var tryPick : {
                <_M1, _M2, _M3>(f: {
                    (x: _M1): __ABBREV.__WebSharper.OptionProxy<_M2>;
                }, s: __ABBREV.__WebSharper.seq<_M3>): __ABBREV.__WebSharper.OptionProxy<_M2>;
            };
            var unfold : {
                <_M1, _M2>(f: {
                    (x: _M1): __ABBREV.__WebSharper.OptionProxy<any>;
                }, s: _M1): __ABBREV.__WebSharper.seq<_M2>;
            };
            var windowed : {
                <_M1>(windowSize: number, s: __ABBREV.__WebSharper.seq<_M1>): __ABBREV.__WebSharper.seq<_M1[]>;
            };
            var zip : {
                <_M1, _M2>(s1: __ABBREV.__WebSharper.seq<_M1>, s2: __ABBREV.__WebSharper.seq<_M2>): __ABBREV.__WebSharper.seq<any>;
            };
            var zip3 : {
                <_M1, _M2, _M3>(s1: __ABBREV.__WebSharper.seq<_M1>, s2: __ABBREV.__WebSharper.seq<_M2>, s3: __ABBREV.__WebSharper.seq<_M3>): __ABBREV.__WebSharper.seq<any>;
            };
            var enumFinally : {
                <_M1>(s: __ABBREV.__WebSharper.seq<_M1>, f: {
                    (): void;
                }): __ABBREV.__WebSharper.seq<_M1>;
            };
            var enumUsing : {
                <_M1, _M2, _M3>(x: _M1, f: {
                    (x: _M1): _M2;
                }): __ABBREV.__WebSharper.seq<_M3>;
            };
            var enumWhile : {
                <_M1>(f: {
                    (): boolean;
                }, s: __ABBREV.__WebSharper.seq<_M1>): __ABBREV.__WebSharper.seq<_M1>;
            };
        }
        module Queue {
            interface QueueProxy<_T1> {
            }
        }
        module Option {
            var bind : {
                <_M1, _M2>(f: {
                    (x: _M1): __ABBREV.__WebSharper.OptionProxy<_M2>;
                }, x: __ABBREV.__WebSharper.OptionProxy<_M1>): __ABBREV.__WebSharper.OptionProxy<_M2>;
            };
            var exists : {
                <_M1>(p: {
                    (x: _M1): boolean;
                }, x: __ABBREV.__WebSharper.OptionProxy<_M1>): boolean;
            };
            var fold : {
                <_M1, _M2>(f: {
                    (x: _M2): {
                        (x: _M1): _M2;
                    };
                }, s: _M2, x: __ABBREV.__WebSharper.OptionProxy<_M1>): _M2;
            };
            var foldBack : {
                <_M1, _M2>(f: {
                    (x: _M1): {
                        (x: _M2): _M2;
                    };
                }, x: __ABBREV.__WebSharper.OptionProxy<_M1>, s: _M2): _M2;
            };
            var forall : {
                <_M1>(p: {
                    (x: _M1): boolean;
                }, x: __ABBREV.__WebSharper.OptionProxy<_M1>): boolean;
            };
            var iter : {
                <_M1>(p: {
                    (x: _M1): void;
                }, x: __ABBREV.__WebSharper.OptionProxy<_M1>): void;
            };
            var map : {
                <_M1, _M2>(f: {
                    (x: _M1): _M2;
                }, x: __ABBREV.__WebSharper.OptionProxy<_M1>): __ABBREV.__WebSharper.OptionProxy<_M2>;
            };
            var toArray : {
                <_M1>(x: __ABBREV.__WebSharper.OptionProxy<_M1>): _M1[];
            };
            var toList : {
                <_M1>(x: __ABBREV.__WebSharper.OptionProxy<_M1>): __ABBREV.__List.T<_M1>;
            };
        }
        module OperatorIntrinsics {
            var GetStringSlice : {
                (source: string, start: __ABBREV.__WebSharper.OptionProxy<number>, finish: __ABBREV.__WebSharper.OptionProxy<number>): string;
            };
            var GetArraySlice : {
                <_M1>(source: _M1[], start: __ABBREV.__WebSharper.OptionProxy<number>, finish: __ABBREV.__WebSharper.OptionProxy<number>): _M1[];
            };
            var SetArraySlice : {
                <_M1>(dst: _M1[], start: __ABBREV.__WebSharper.OptionProxy<number>, finish: __ABBREV.__WebSharper.OptionProxy<number>, src: _M1[]): void;
            };
            var GetArraySlice2D : {
                <_M1>(arr: any, start1: __ABBREV.__WebSharper.OptionProxy<number>, finish1: __ABBREV.__WebSharper.OptionProxy<number>, start2: __ABBREV.__WebSharper.OptionProxy<number>, finish2: __ABBREV.__WebSharper.OptionProxy<number>): any;
            };
            var GetArraySlice2DFixed1 : {
                <_M1>(arr: any, fixed1: number, start2: __ABBREV.__WebSharper.OptionProxy<number>, finish2: __ABBREV.__WebSharper.OptionProxy<number>): _M1[];
            };
            var GetArraySlice2DFixed2 : {
                <_M1>(arr: any, start1: __ABBREV.__WebSharper.OptionProxy<number>, finish1: __ABBREV.__WebSharper.OptionProxy<number>, fixed2: number): _M1[];
            };
            var SetArraySlice2DFixed1 : {
                <_M1>(dst: any, fixed1: number, start2: __ABBREV.__WebSharper.OptionProxy<number>, finish2: __ABBREV.__WebSharper.OptionProxy<number>, src: _M1[]): void;
            };
            var SetArraySlice2DFixed2 : {
                <_M1>(dst: any, start1: __ABBREV.__WebSharper.OptionProxy<number>, finish1: __ABBREV.__WebSharper.OptionProxy<number>, fixed2: number, src: _M1[]): void;
            };
            var SetArraySlice2D : {
                <_M1>(dst: any, start1: __ABBREV.__WebSharper.OptionProxy<number>, finish1: __ABBREV.__WebSharper.OptionProxy<number>, start2: __ABBREV.__WebSharper.OptionProxy<number>, finish2: __ABBREV.__WebSharper.OptionProxy<number>, src: any): void;
            };
        }
        module Operators {
            var range : {
                <_M1>(min: _M1, max: _M1): __ABBREV.__WebSharper.seq<_M1>;
            };
            var step : {
                <_M1, _M2>(min: _M1, step: _M2, max: _M1): __ABBREV.__WebSharper.seq<_M1>;
            };
            var Compare : {
                <_M1>(a: _M1, b: _M1): number;
            };
            var Decrement : {
                (x: __ABBREV.__WebSharper.ref<number>): void;
            };
            var DefaultArg : {
                <_M1>(x: __ABBREV.__WebSharper.OptionProxy<_M1>, d: _M1): _M1;
            };
            var FailWith : {
                <_M1>(msg: string): _M1;
            };
            var Increment : {
                (x: __ABBREV.__WebSharper.ref<number>): void;
            };
            var Max : {
                <_M1>(a: _M1, b: _M1): _M1;
            };
            var Min : {
                <_M1>(a: _M1, b: _M1): _M1;
            };
            var Pown : {
                <_M1>(a: _M1, n: number): number;
            };
            var Sign : {
                <_M1>(x: _M1): number;
            };
            var Truncate : {
                <_M1>(x: _M1): _M1;
            };
            var Using : {
                <_M1, _M2>(t: _M1, f: {
                    (x: _M1): _M2;
                }): _M2;
            };
            var KeyValue : {
                <_M1, _M2>(kvp: __ABBREV.__WebSharper.KeyValuePairProxy<_M1, _M2>): any;
            };
        }
        module Lazy {
            var Create : {
                <_M1>(f: {
                    (): _M1;
                }): __ABBREV.__WebSharper.LazyProxy<_M1>;
            };
            var CreateFromValue : {
                <_M1>(v: _M1): __ABBREV.__WebSharper.LazyProxy<_M1>;
            };
            var Force : {
                <_M1>(x: __ABBREV.__WebSharper.LazyProxy<_M1>): _M1;
            };
        }
        module ExtraTopLevelOperatorsProxy {
            var array2D : {
                <_M1, _M2>(rows: __ABBREV.__WebSharper.seq<_M1>): any;
            };
        }
        module Util {
            var observer : {
                <_M1>(h: {
                    (x: _M1): void;
                }): any;
            };
            var addListener : {
                <_M1>(event: any, h: {
                    (x: _M1): void;
                }): void;
            };
            var subscribeTo : {
                <_M1>(event: any, h: {
                    (x: _M1): void;
                }): __ABBREV.__WebSharper.IDisposableProxy;
            };
        }
        module Arrays2D {
            var zeroCreate : {
                <_M1>(n: number, m: number): any;
            };
            var init : {
                <_M1>(n: number, m: number, f: {
                    (x: number): {
                        (x: number): _M1;
                    };
                }): any;
            };
            var iter : {
                <_M1>(f: {
                    (x: _M1): void;
                }, array: any): void;
            };
            var iteri : {
                <_M1>(f: {
                    (x: number): {
                        (x: number): {
                            (x: _M1): void;
                        };
                    };
                }, array: any): void;
            };
            var map : {
                <_M1, _M2>(f: {
                    (x: _M1): _M2;
                }, array: any): any;
            };
            var mapi : {
                <_M1, _M2>(f: {
                    (x: number): {
                        (x: number): {
                            (x: _M1): _M2;
                        };
                    };
                }, array: any): any;
            };
            var copy : {
                <_M1>(array: any): any;
            };
        }
        module IntrinsicFunctionProxy {
            var GetArraySub : {
                <_M1>(arr: _M1[], start: number, len: number): _M1[];
            };
            var SetArraySub : {
                <_M1>(arr: _M1[], start: number, len: number, src: _M1[]): void;
            };
            var Array2DZeroCreate : {
                <_M1>(n: number, m: number): any;
            };
            var GetArray2DSub : {
                <_M1>(src: any, src1: number, src2: number, len1: number, len2: number): any;
            };
            var SetArray2DSub : {
                <_M1>(dst: any, src1: number, src2: number, len1: number, len2: number, src: any): void;
            };
            var GetLength : {
                <_M1>(arr: __ABBREV.__WebSharper.ArrayProxy): number;
            };
        }
        module Pervasives {
            var NewFromList : {
                <_M1>(fields: __ABBREV.__WebSharper.seq<any>): _M1;
            };
        }
        module Remoting {
            interface IAjaxProvider {
                Async(x0: string, x1: __ABBREV.__WebSharper.ObjectProxy, x2: string, x3: {
                    (x: string): void;
                }, x4: {
                    (x: __ABBREV.__WebSharper.ExceptionProxy): void;
                }): void;
                Sync(x0: string, x1: __ABBREV.__WebSharper.ObjectProxy, x2: string): string;
            }
            var makeHeaders : {
                (m: string): __ABBREV.__WebSharper.ObjectProxy;
            };
            var makePayload : {
                (data: __ABBREV.__WebSharper.ObjectProxy[]): string;
            };
            var Call : {
                (m: string, data: __ABBREV.__WebSharper.ObjectProxy[]): __ABBREV.__WebSharper.ObjectProxy;
            };
            var Async : {
                (m: string, data: __ABBREV.__WebSharper.ObjectProxy[]): any;
            };
            var Send : {
                (m: string, data: __ABBREV.__WebSharper.ObjectProxy[]): void;
            };
            var EndPoint : {
                (): string;
            };
            var AjaxProvider : {
                (): __ABBREV.__Remoting.IAjaxProvider;
            };
        }
        module Json {
            interface Resource {
            }
            var lookup : {
                <_M1>(x: string[]): __ABBREV.__WebSharper.ObjectProxy;
            };
            var restore : {
                (ty: __ABBREV.__WebSharper.ObjectProxy, obj: __ABBREV.__WebSharper.ObjectProxy): __ABBREV.__WebSharper.ObjectProxy;
            };
            var shallowMap : {
                (f: {
                    (x: __ABBREV.__WebSharper.ObjectProxy): __ABBREV.__WebSharper.ObjectProxy;
                }, x: __ABBREV.__WebSharper.ObjectProxy): __ABBREV.__WebSharper.ObjectProxy;
            };
            var Activate : {
                <_M1>(json: __ABBREV.__WebSharper.ObjectProxy): _M1;
            };
        }
        module JavaScript {
            interface Kind {
            }
        }
        interface ArrayProxy {
        }
        interface AsyncProxy {
        }
        interface AsyncBuilderProxy {
        }
        interface Char {
        }
        interface ChoiceProxy11<_T1, _T2> {
        }
        interface ChoiceProxy3<_T1, _T2, _T3> {
        }
        interface ChoiceProxy1<_T1, _T2, _T3, _T4> {
        }
        interface ChoiceProxy2<_T1, _T2, _T3, _T4, _T5> {
        }
        interface ChoiceProxy4<_T1, _T2, _T3, _T4, _T5, _T6> {
        }
        interface ChoiceProxy<_T1, _T2, _T3, _T4, _T5, _T6, _T7> {
        }
        interface DateTimeProxy {
        }
        interface DoubleProxy {
        }
        interface ExceptionProxy {
        }
        interface MatchFailureExceptionProxy {
        }
        interface IDisposableProxy {
            Dispose(): void;
        }
        interface seq<_T1> {
        }
        interface IEnumeratorProxy1 {
            MoveNext(): boolean;
            Reset(): void;
            get_Current(): __ABBREV.__WebSharper.ObjectProxy;
        }
        interface ObjectProxy {
        }
        interface IEnumeratorProxy<_T1> {
            get_Current(): _T1;
        }
        interface Int32Proxy {
        }
        interface KeyValuePairProxy<_T1, _T2> {
        }
        interface LazyProxy<_T1> {
        }
        interface Math {
        }
        interface OptionProxy<_T1> {
        }
        interface TimeSpanProxy {
        }
        interface ref<_T1> {
        }
    }
}
declare module __ABBREV {
    
    export import __WebSharper = IntelliFactory.WebSharper;
    export import __List = IntelliFactory.WebSharper.List;
    export import __Remoting = IntelliFactory.WebSharper.Remoting;
}

declare module IntelliFactory {
    module WebSharper {
        module Html {
            module Element {
                var New : {
                    (html: __ABBREV.__Interfaces.IHtmlProvider, name: string): __ABBREV.__Html.Element;
                };
            }
            module Interfaces {
                interface IHtmlProvider {
                    CreateTextNode(x0: string): __ABBREV.__Dom.Text;
                    CreateElement(x0: string): __ABBREV.__Dom.Element;
                    SetAttribute(x0: __ABBREV.__Dom.Node, x1: string, x2: string): void;
                    AppendAttribute(x0: __ABBREV.__Dom.Node, x1: __ABBREV.__Dom.Attr): void;
                    RemoveAttribute(x0: __ABBREV.__Dom.Node, x1: string): void;
                    GetAttribute(x0: __ABBREV.__Dom.Node, x1: string): string;
                    HasAttribute(x0: __ABBREV.__Dom.Node, x1: string): boolean;
                    CreateAttribute(x0: string): __ABBREV.__Dom.Attr;
                    GetProperty<_M1>(x0: __ABBREV.__Dom.Node, x1: string): _M1;
                    SetProperty<_M1>(x0: __ABBREV.__Dom.Node, x1: string, x2: _M1): void;
                    AppendNode(x0: __ABBREV.__Dom.Node, x1: __ABBREV.__Dom.Node): void;
                    Clear(x0: __ABBREV.__Dom.Node): void;
                    Remove(x0: __ABBREV.__Dom.Node): void;
                    SetText(x0: __ABBREV.__Dom.Node, x1: string): void;
                    GetText(x0: __ABBREV.__Dom.Node): string;
                    SetHtml(x0: __ABBREV.__Dom.Node, x1: string): void;
                    GetHtml(x0: __ABBREV.__Dom.Node): string;
                    SetValue(x0: __ABBREV.__Dom.Node, x1: string): void;
                    GetValue(x0: __ABBREV.__Dom.Node): string;
                    SetStyle(x0: __ABBREV.__Dom.Node, x1: string): void;
                    SetCss(x0: __ABBREV.__Dom.Node, x1: string, x2: string): void;
                    AddClass(x0: __ABBREV.__Dom.Node, x1: string): void;
                    RemoveClass(x0: __ABBREV.__Dom.Node, x1: string): void;
                    OnLoad(x0: __ABBREV.__Dom.Node, x1: {
                        (): void;
                    }): void;
                    OnDocumentReady(x0: {
                        (): void;
                    }): void;
                }
            }
            module Activator {
                interface IControl {
                    get_Body(): __ABBREV.__Html.IPagelet;
                }
                var Activate : {
                    (): void;
                };
            }
            module EventsPervasives {
                var Events : {
                    (): __ABBREV.__Events.IEventSupport;
                };
            }
            module Events {
                interface IEventSupport {
                    OnClick<_M1>(x0: {
                        (x: _M1): {
                            (x: any): void;
                        };
                    }, x1: _M1): void;
                    OnDoubleClick<_M1>(x0: {
                        (x: _M1): {
                            (x: any): void;
                        };
                    }, x1: _M1): void;
                    OnMouseDown<_M1>(x0: {
                        (x: _M1): {
                            (x: any): void;
                        };
                    }, x1: _M1): void;
                    OnMouseEnter<_M1>(x0: {
                        (x: _M1): {
                            (x: any): void;
                        };
                    }, x1: _M1): void;
                    OnMouseLeave<_M1>(x0: {
                        (x: _M1): {
                            (x: any): void;
                        };
                    }, x1: _M1): void;
                    OnMouseMove<_M1>(x0: {
                        (x: _M1): {
                            (x: any): void;
                        };
                    }, x1: _M1): void;
                    OnMouseOut<_M1>(x0: {
                        (x: _M1): {
                            (x: any): void;
                        };
                    }, x1: _M1): void;
                    OnMouseUp<_M1>(x0: {
                        (x: _M1): {
                            (x: any): void;
                        };
                    }, x1: _M1): void;
                    OnKeyDown<_M1>(x0: {
                        (x: _M1): {
                            (x: any): void;
                        };
                    }, x1: _M1): void;
                    OnKeyPress<_M1>(x0: {
                        (x: _M1): {
                            (x: any): void;
                        };
                    }, x1: _M1): void;
                    OnKeyUp<_M1>(x0: {
                        (x: _M1): {
                            (x: any): void;
                        };
                    }, x1: _M1): void;
                    OnBlur<_M1>(x0: {
                        (x: _M1): void;
                    }, x1: _M1): void;
                    OnChange<_M1>(x0: {
                        (x: _M1): void;
                    }, x1: _M1): void;
                    OnFocus<_M1>(x0: {
                        (x: _M1): void;
                    }, x1: _M1): void;
                    OnError<_M1>(x0: {
                        (x: _M1): void;
                    }, x1: _M1): void;
                    OnLoad<_M1>(x0: {
                        (x: _M1): void;
                    }, x1: _M1): void;
                    OnUnLoad<_M1>(x0: {
                        (x: _M1): void;
                    }, x1: _M1): void;
                    OnResize<_M1>(x0: {
                        (x: _M1): void;
                    }, x1: _M1): void;
                    OnScroll<_M1>(x0: {
                        (x: _M1): void;
                    }, x1: _M1): void;
                    OnSelect<_M1>(x0: {
                        (x: _M1): void;
                    }, x1: _M1): void;
                    OnSubmit<_M1>(x0: {
                        (x: _M1): void;
                    }, x1: _M1): void;
                }
                interface MouseEvent {
                    X: number;
                    Y: number;
                }
                interface CharacterCode {
                    CharacterCode: number;
                }
                interface KeyCode {
                    KeyCode: number;
                }
            }
            module Default {
                module HTML5 {
                    var Tags : {
                        (): __ABBREV.__Html.Html5TagBuilder;
                    };
                    var Attr : {
                        (): __ABBREV.__Html.Html5AttributeBuilder;
                    };
                }
                var OnLoad : {
                    (init: {
                        (): void;
                    }): void;
                };
                var Text : {
                    (x: string): __ABBREV.__Html.IPagelet;
                };
                var A : {
                    <_M1>(x: __ABBREV.__WebSharper.seq<_M1>): __ABBREV.__Html.Element;
                };
                var B : {
                    <_M1>(x: __ABBREV.__WebSharper.seq<_M1>): __ABBREV.__Html.Element;
                };
                var Body : {
                    <_M1>(x: __ABBREV.__WebSharper.seq<_M1>): __ABBREV.__Html.Element;
                };
                var Br : {
                    <_M1>(x: __ABBREV.__WebSharper.seq<_M1>): __ABBREV.__Html.Element;
                };
                var Button : {
                    <_M1>(x: __ABBREV.__WebSharper.seq<_M1>): __ABBREV.__Html.Element;
                };
                var Code : {
                    <_M1>(x: __ABBREV.__WebSharper.seq<_M1>): __ABBREV.__Html.Element;
                };
                var Div : {
                    <_M1>(x: __ABBREV.__WebSharper.seq<_M1>): __ABBREV.__Html.Element;
                };
                var Em : {
                    <_M1>(x: __ABBREV.__WebSharper.seq<_M1>): __ABBREV.__Html.Element;
                };
                var Form : {
                    <_M1>(x: __ABBREV.__WebSharper.seq<_M1>): __ABBREV.__Html.Element;
                };
                var H1 : {
                    <_M1>(x: __ABBREV.__WebSharper.seq<_M1>): __ABBREV.__Html.Element;
                };
                var H2 : {
                    <_M1>(x: __ABBREV.__WebSharper.seq<_M1>): __ABBREV.__Html.Element;
                };
                var H3 : {
                    <_M1>(x: __ABBREV.__WebSharper.seq<_M1>): __ABBREV.__Html.Element;
                };
                var H4 : {
                    <_M1>(x: __ABBREV.__WebSharper.seq<_M1>): __ABBREV.__Html.Element;
                };
                var Head : {
                    <_M1>(x: __ABBREV.__WebSharper.seq<_M1>): __ABBREV.__Html.Element;
                };
                var Hr : {
                    <_M1>(x: __ABBREV.__WebSharper.seq<_M1>): __ABBREV.__Html.Element;
                };
                var I : {
                    <_M1>(x: __ABBREV.__WebSharper.seq<_M1>): __ABBREV.__Html.Element;
                };
                var IFrame : {
                    <_M1>(x: __ABBREV.__WebSharper.seq<_M1>): __ABBREV.__Html.Element;
                };
                var Img : {
                    <_M1>(x: __ABBREV.__WebSharper.seq<_M1>): __ABBREV.__Html.Element;
                };
                var Input : {
                    <_M1>(x: __ABBREV.__WebSharper.seq<_M1>): __ABBREV.__Html.Element;
                };
                var LI : {
                    <_M1>(x: __ABBREV.__WebSharper.seq<_M1>): __ABBREV.__Html.Element;
                };
                var OL : {
                    <_M1>(x: __ABBREV.__WebSharper.seq<_M1>): __ABBREV.__Html.Element;
                };
                var P : {
                    <_M1>(x: __ABBREV.__WebSharper.seq<_M1>): __ABBREV.__Html.Element;
                };
                var Pre : {
                    <_M1>(x: __ABBREV.__WebSharper.seq<_M1>): __ABBREV.__Html.Element;
                };
                var Script : {
                    <_M1>(x: __ABBREV.__WebSharper.seq<_M1>): __ABBREV.__Html.Element;
                };
                var Select : {
                    <_M1>(x: __ABBREV.__WebSharper.seq<_M1>): __ABBREV.__Html.Element;
                };
                var Span : {
                    <_M1>(x: __ABBREV.__WebSharper.seq<_M1>): __ABBREV.__Html.Element;
                };
                var Table : {
                    <_M1>(x: __ABBREV.__WebSharper.seq<_M1>): __ABBREV.__Html.Element;
                };
                var TBody : {
                    <_M1>(x: __ABBREV.__WebSharper.seq<_M1>): __ABBREV.__Html.Element;
                };
                var TD : {
                    <_M1>(x: __ABBREV.__WebSharper.seq<_M1>): __ABBREV.__Html.Element;
                };
                var TextArea : {
                    <_M1>(x: __ABBREV.__WebSharper.seq<_M1>): __ABBREV.__Html.Element;
                };
                var TFoot : {
                    <_M1>(x: __ABBREV.__WebSharper.seq<_M1>): __ABBREV.__Html.Element;
                };
                var TH : {
                    <_M1>(x: __ABBREV.__WebSharper.seq<_M1>): __ABBREV.__Html.Element;
                };
                var THead : {
                    <_M1>(x: __ABBREV.__WebSharper.seq<_M1>): __ABBREV.__Html.Element;
                };
                var TR : {
                    <_M1>(x: __ABBREV.__WebSharper.seq<_M1>): __ABBREV.__Html.Element;
                };
                var UL : {
                    <_M1>(x: __ABBREV.__WebSharper.seq<_M1>): __ABBREV.__Html.Element;
                };
                var NewAttr : {
                    (x: string): {
                        (x: string): __ABBREV.__Html.IPagelet;
                    };
                };
                var Action : {
                    (x: string): __ABBREV.__Html.IPagelet;
                };
                var Align : {
                    (x: string): __ABBREV.__Html.IPagelet;
                };
                var Alt : {
                    (x: string): __ABBREV.__Html.IPagelet;
                };
                var HRef : {
                    (x: string): __ABBREV.__Html.IPagelet;
                };
                var Height : {
                    (x: string): __ABBREV.__Html.IPagelet;
                };
                var Id : {
                    (x: string): __ABBREV.__Html.IPagelet;
                };
                var Name : {
                    (x: string): __ABBREV.__Html.IPagelet;
                };
                var RowSpan : {
                    (x: string): __ABBREV.__Html.IPagelet;
                };
                var Selected : {
                    (x: string): __ABBREV.__Html.IPagelet;
                };
                var Src : {
                    (x: string): __ABBREV.__Html.IPagelet;
                };
                var VAlign : {
                    (x: string): __ABBREV.__Html.IPagelet;
                };
                var Width : {
                    (x: string): __ABBREV.__Html.IPagelet;
                };
                var Tags : {
                    (): __ABBREV.__Html.TagBuilder;
                };
                var Deprecated : {
                    (): __ABBREV.__Html.DeprecatedTagBuilder;
                };
                var Attr : {
                    (): __ABBREV.__Html.AttributeBuilder;
                };
            }
            module Operators {
                var add : {
                    <_M1>(el: __ABBREV.__Html.Element, inner: __ABBREV.__WebSharper.seq<_M1>): __ABBREV.__Html.Element;
                };
                var OnAfterRender : {
                    <_M1>(f: {
                        (x: _M1): void;
                    }, w: _M1): void;
                };
                var OnBeforeRender : {
                    <_M1>(f: {
                        (x: _M1): void;
                    }, w: _M1): void;
                };
            }
            module PageletExtensions {
                var IPagelet_AppendTo : {
                    (p: __ABBREV.__Html.IPagelet, targetId: string): void;
                };
            }
            interface IPagelet {
                Render(): void;
                get_Body(): __ABBREV.__Dom.Node;
            }
            interface Element {
                OnLoad(f: {
                    (): void;
                }): void;
                AppendI(pl: __ABBREV.__Html.IPagelet): void;
                AppendN(node: __ABBREV.__Dom.Node): void;
                Render(): void;
                get_Body(): __ABBREV.__Dom.Node;
                get_Text(): string;
                set_Text(x: string): void;
                get_Html(): string;
                set_Html(x: string): void;
                get_Value(): string;
                set_Value(x: string): void;
                get_Id(): string;
                get_HtmlProvider(): __ABBREV.__Interfaces.IHtmlProvider;
                get_Item(name: string): string;
                set_Item(name: string, value: string): void;
            }
            interface Html5TagBuilder {
                NewTag<_M1>(name: string, children: __ABBREV.__WebSharper.seq<_M1>): __ABBREV.__Html.Element;
            }
            interface DeprecatedTagBuilder {
                NewTag<_M1>(name: string, children: __ABBREV.__WebSharper.seq<_M1>): __ABBREV.__Html.Element;
            }
            interface TagBuilder {
                NewTag<_M1>(name: string, children: __ABBREV.__WebSharper.seq<_M1>): __ABBREV.__Html.Element;
                text(data: string): __ABBREV.__Html.IPagelet;
                Div<_M1>(x: __ABBREV.__WebSharper.seq<_M1>): __ABBREV.__Html.Element;
            }
            interface Html5AttributeBuilder {
                NewAttr(name: string, value: string): __ABBREV.__Html.IPagelet;
            }
            interface DeprecatedAttributeBuilder {
                NewAttr(name: string, value: string): __ABBREV.__Html.IPagelet;
            }
            interface AttributeBuilder {
                NewAttr(name: string, value: string): __ABBREV.__Html.IPagelet;
                Class(x: string): __ABBREV.__Html.IPagelet;
                get_CheckBox(): __ABBREV.__Html.IPagelet;
                get_Hidden(): __ABBREV.__Html.IPagelet;
                get_Radio(): __ABBREV.__Html.IPagelet;
                get_Reset(): __ABBREV.__Html.IPagelet;
                get_Submit(): __ABBREV.__Html.IPagelet;
                get_Password(): __ABBREV.__Html.IPagelet;
                get_TextField(): __ABBREV.__Html.IPagelet;
            }
        }
    }
}
declare module __ABBREV {
    
    export import __Interfaces = IntelliFactory.WebSharper.Html.Interfaces;
    export import __Html = IntelliFactory.WebSharper.Html;
    export import __Dom = IntelliFactory.WebSharper.Dom;
    export import __Events = IntelliFactory.WebSharper.Html.Events;
    export import __WebSharper = IntelliFactory.WebSharper;
}

declare module IntelliFactory {
    module WebSharper {
        module Testing {
            module Assert {
                var Raises : {
                    <_M1>(f: {
                        (): void;
                    }): void;
                };
                var For : {
                    <_M1>(times: number, gen: any, attempt: {
                        (x: _M1): void;
                    }): void;
                };
            }
            module Random {
                interface Generator<_T1> {
                    Base: _T1[];
                    Next: {
                        (): _T1;
                    };
                }
                var Map : {
                    <_M1, _M2>(f: {
                        (x: _M1): _M2;
                    }, gen: any): any;
                };
                var Implies : {
                    (a: boolean, b: boolean): boolean;
                };
                var Imply : {
                    (a: boolean, b: boolean): boolean;
                };
                var Exponential : {
                    (lambda: number): any;
                };
                var Within : {
                    (low: number, hi: number): any;
                };
                var FloatWithin : {
                    (low: number, hi: number): any;
                };
                var ArrayOf : {
                    <_M1>(generator: any): any;
                };
                var ListOf : {
                    <_M1>(generator: any): any;
                };
                var Tuple2Of : {
                    <_M1, _M2>(a: any, b: any): any;
                };
                var Tuple3Of : {
                    <_M1, _M2, _M3>(a: any, b: any, c: any): any;
                };
                var OneOf : {
                    <_M1>(seeds: _M1[]): any;
                };
                var Mix : {
                    <_M1>(a: any, b: any): any;
                };
                var Const : {
                    <_M1>(x: _M1): any;
                };
                var OptionOf : {
                    <_M1>(generator: any): any;
                };
                var StandardUniform : {
                    (): any;
                };
                var Boolean : {
                    (): any;
                };
                var Float : {
                    (): any;
                };
                var FloatExhaustive : {
                    (): any;
                };
                var Int : {
                    (): any;
                };
                var Natural : {
                    (): any;
                };
                var String : {
                    (): any;
                };
                var StringExhaustive : {
                    (): any;
                };
            }
            module Pervasives {
                interface TestBuilder {
                    Delay(f: {
                        (): void;
                    }): void;
                    Zero(): void;
                }
                var Test : {
                    (name: string): __ABBREV.__Pervasives.TestBuilder;
                };
                var Is : {
                    <_M1>(a: _M1, b: _M1): void;
                };
                var Isnt : {
                    <_M1>(a: _M1, b: _M1): void;
                };
            }
        }
    }
}
declare module __ABBREV {
    
    export import __Pervasives = IntelliFactory.WebSharper.Testing.Pervasives;
}

declare module IntelliFactory {
    module WebSharper {
        module Control {
            module EventModule {
                var Choose : {
                    <_M1, _M2, _M3>(c: {
                        (x: _M1): __ABBREV.__WebSharper.OptionProxy<_M2>;
                    }, e: any): any;
                };
                var Filter : {
                    <_M1, _M2>(ok: {
                        (x: _M1): boolean;
                    }, e: any): any;
                };
                var Map : {
                    <_M1, _M2, _M3>(f: {
                        (x: _M1): _M2;
                    }, e: any): any;
                };
                var Merge : {
                    <_M1, _M2, _M3>(e1: any, e2: any): any;
                };
                var Pairwise : {
                    <_M1, _M2>(e: any): any;
                };
                var Partition : {
                    <_M1, _M2>(f: {
                        (x: _M1): boolean;
                    }, e: any): any;
                };
                var Scan : {
                    <_M1, _M2, _M3>(fold: {
                        (x: _M1): {
                            (x: _M2): _M1;
                        };
                    }, seed: _M1, e: any): any;
                };
                var Split : {
                    <_M1, _M2, _M3, _M4>(f: {
                        (x: _M1): __ABBREV.__WebSharper.ChoiceProxy11<_M2, _M3>;
                    }, e: any): any;
                };
            }
            module ObservableModule {
                var Pairwise : {
                    <_M1>(e: __ABBREV.__Control.IObservableProxy<_M1>): __ABBREV.__Control.IObservableProxy<any>;
                };
                var Partition : {
                    <_M1>(f: {
                        (x: _M1): boolean;
                    }, e: __ABBREV.__Control.IObservableProxy<_M1>): any;
                };
                var Scan : {
                    <_M1, _M2>(fold: {
                        (x: _M1): {
                            (x: _M2): _M1;
                        };
                    }, seed: _M1, e: __ABBREV.__Control.IObservableProxy<_M2>): __ABBREV.__Control.IObservableProxy<_M1>;
                };
                var Split : {
                    <_M1, _M2, _M3>(f: {
                        (x: _M1): __ABBREV.__WebSharper.ChoiceProxy11<_M2, _M3>;
                    }, e: __ABBREV.__Control.IObservableProxy<_M1>): any;
                };
            }
            interface IObserverProxy<_T1> {
                OnCompleted(): void;
                OnError(x0: __ABBREV.__WebSharper.ExceptionProxy): void;
                OnNext(x0: _T1): void;
            }
            interface IObservableProxy<_T1> {
                Subscribe(x0: __ABBREV.__Control.IObserverProxy<_T1>): __ABBREV.__WebSharper.IDisposableProxy;
            }
            interface FSharpEvent<_T1> {
            }
        }
    }
}
declare module __ABBREV {
    
    export import __WebSharper = IntelliFactory.WebSharper;
    export import __Control = IntelliFactory.WebSharper.Control;
}

declare module IntelliFactory {
    module WebSharper {
        module Collections {
            module LinkedList {
                interface NodeProxy<_T1> {
                }
                interface EnumeratorProxy<_T1> {
                    MoveNext(): boolean;
                    Dispose(): void;
                    get_Current(): _T1;
                }
                interface ListProxy<_T1> {
                    AddAfter(after: __ABBREV.__LinkedList.NodeProxy<_T1>, value: _T1): __ABBREV.__LinkedList.NodeProxy<_T1>;
                    AddBefore(before: __ABBREV.__LinkedList.NodeProxy<_T1>, value: _T1): __ABBREV.__LinkedList.NodeProxy<_T1>;
                    AddFirst(value: _T1): __ABBREV.__LinkedList.NodeProxy<_T1>;
                    AddLast(value: _T1): __ABBREV.__LinkedList.NodeProxy<_T1>;
                    Clear(): void;
                    Contains<_M1>(value: _M1): boolean;
                    Find(value: _T1): __ABBREV.__LinkedList.NodeProxy<_T1>;
                    FindLast(value: _T1): __ABBREV.__LinkedList.NodeProxy<_T1>;
                    GetEnumerator(): __ABBREV.__LinkedList.EnumeratorProxy<_T1>;
                    Remove(node: __ABBREV.__LinkedList.NodeProxy<_T1>): void;
                    Remove1(value: _T1): boolean;
                    RemoveFirst(): void;
                    RemoveLast(): void;
                    get_Count(): number;
                    get_First(): __ABBREV.__LinkedList.NodeProxy<_T1>;
                    get_Last(): __ABBREV.__LinkedList.NodeProxy<_T1>;
                }
            }
            module ResizeArray {
                interface ResizeArrayProxy<_T1> {
                    GetEnumerator(): __ABBREV.__WebSharper.IEnumeratorProxy<__ABBREV.__WebSharper.ObjectProxy>;
                    Add(x: _T1): void;
                    AddRange(x: __ABBREV.__WebSharper.seq<_T1>): void;
                    Clear(): void;
                    CopyTo(arr: _T1[]): void;
                    CopyTo1(arr: _T1[], offset: number): void;
                    CopyTo2(index: number, target: _T1[], offset: number, count: number): void;
                    GetRange(index: number, count: number): __ABBREV.__ResizeArray.ResizeArrayProxy<_T1>;
                    Insert(index: number, items: _T1): void;
                    InsertRange(index: number, items: __ABBREV.__WebSharper.seq<_T1>): void;
                    RemoveAt(x: number): void;
                    RemoveRange(index: number, count: number): void;
                    Reverse(): void;
                    Reverse1(index: number, count: number): void;
                    ToArray(): _T1[];
                    get_Count(): number;
                    get_Item(x: number): _T1;
                    set_Item(x: number, v: _T1): void;
                }
            }
            module SetModule {
                var Filter : {
                    <_M1>(f: {
                        (x: _M1): boolean;
                    }, s: __ABBREV.__Collections.FSharpSet<_M1>): __ABBREV.__Collections.FSharpSet<_M1>;
                };
                var FoldBack : {
                    <_M1, _M2>(f: {
                        (x: _M1): {
                            (x: _M2): _M2;
                        };
                    }, a: __ABBREV.__Collections.FSharpSet<_M1>, s: _M2): _M2;
                };
                var Partition : {
                    <_M1>(f: {
                        (x: _M1): boolean;
                    }, a: __ABBREV.__Collections.FSharpSet<_M1>): any;
                };
            }
            module MapModule {
                var Exists : {
                    <_M1, _M2>(f: {
                        (x: _M1): {
                            (x: _M2): boolean;
                        };
                    }, m: __ABBREV.__Collections.FSharpMap<_M1, _M2>): boolean;
                };
                var Filter : {
                    <_M1, _M2>(f: {
                        (x: _M1): {
                            (x: _M2): boolean;
                        };
                    }, m: __ABBREV.__Collections.FSharpMap<_M1, _M2>): __ABBREV.__Collections.FSharpMap<_M1, _M2>;
                };
                var FindKey : {
                    <_M1, _M2>(f: {
                        (x: _M1): {
                            (x: _M2): boolean;
                        };
                    }, m: __ABBREV.__Collections.FSharpMap<_M1, _M2>): _M1;
                };
                var Fold : {
                    <_M1, _M2, _M3>(f: {
                        (x: _M3): {
                            (x: _M1): {
                                (x: _M2): _M3;
                            };
                        };
                    }, s: _M3, m: __ABBREV.__Collections.FSharpMap<_M1, _M2>): _M3;
                };
                var FoldBack : {
                    <_M1, _M2, _M3>(f: {
                        (x: _M1): {
                            (x: _M2): {
                                (x: _M3): _M3;
                            };
                        };
                    }, m: __ABBREV.__Collections.FSharpMap<_M1, _M2>, s: _M3): _M3;
                };
                var ForAll : {
                    <_M1, _M2>(f: {
                        (x: _M1): {
                            (x: _M2): boolean;
                        };
                    }, m: __ABBREV.__Collections.FSharpMap<_M1, _M2>): boolean;
                };
                var Iterate : {
                    <_M1, _M2>(f: {
                        (x: _M1): {
                            (x: _M2): void;
                        };
                    }, m: __ABBREV.__Collections.FSharpMap<_M1, _M2>): void;
                };
                var OfArray : {
                    <_M1, _M2>(a: any[]): __ABBREV.__Collections.FSharpMap<_M1, _M2>;
                };
                var Partition : {
                    <_M1, _M2>(f: {
                        (x: _M1): {
                            (x: _M2): boolean;
                        };
                    }, m: __ABBREV.__Collections.FSharpMap<_M1, _M2>): any;
                };
                var Pick : {
                    <_M1, _M2, _M3>(f: {
                        (x: _M1): {
                            (x: _M2): __ABBREV.__WebSharper.OptionProxy<_M3>;
                        };
                    }, m: __ABBREV.__Collections.FSharpMap<_M1, _M2>): _M3;
                };
                var ToSeq : {
                    <_M1, _M2>(m: __ABBREV.__Collections.FSharpMap<_M1, _M2>): __ABBREV.__WebSharper.seq<any>;
                };
                var TryFind : {
                    <_M1, _M2>(k: _M1, m: __ABBREV.__Collections.FSharpMap<_M1, _M2>): __ABBREV.__WebSharper.OptionProxy<_M2>;
                };
                var TryFindKey : {
                    <_M1, _M2>(f: {
                        (x: _M1): {
                            (x: _M2): boolean;
                        };
                    }, m: __ABBREV.__Collections.FSharpMap<_M1, _M2>): __ABBREV.__WebSharper.OptionProxy<_M1>;
                };
                var TryPick : {
                    <_M1, _M2, _M3>(f: {
                        (x: _M1): {
                            (x: _M2): __ABBREV.__WebSharper.OptionProxy<_M3>;
                        };
                    }, m: __ABBREV.__Collections.FSharpMap<_M1, _M2>): __ABBREV.__WebSharper.OptionProxy<_M3>;
                };
                var Map : {
                    <_M1, _M2, _M3>(f: {
                        (x: _M1): {
                            (x: _M2): _M3;
                        };
                    }, m: __ABBREV.__Collections.FSharpMap<_M1, _M2>): __ABBREV.__Collections.FSharpMap<_M1, _M3>;
                };
            }
            interface Dictionary<_T1, _T2> {
                Add(k: _T1, v: _T2): void;
                Clear(): void;
                ContainsKey(k: _T1): boolean;
                GetEnumerator(): __ABBREV.__WebSharper.IEnumeratorProxy<__ABBREV.__WebSharper.ObjectProxy>;
                Remove(k: _T1): boolean;
                get_Item(k: _T1): _T2;
                set_Item(k: _T1, v: _T2): void;
            }
            interface FSharpMap<_T1, _T2> {
                Add(k: _T1, v: _T2): __ABBREV.__Collections.FSharpMap<_T1, _T2>;
                ContainsKey(k: _T1): boolean;
                Remove(k: _T1): __ABBREV.__Collections.FSharpMap<_T1, _T2>;
                TryFind(k: _T1): __ABBREV.__WebSharper.OptionProxy<_T2>;
                GetEnumerator(): __ABBREV.__WebSharper.IEnumeratorProxy<__ABBREV.__WebSharper.KeyValuePairProxy<_T1, _T2>>;
                GetHashCode(): number;
                Equals(other: __ABBREV.__WebSharper.ObjectProxy): boolean;
                CompareTo(other: __ABBREV.__WebSharper.ObjectProxy): number;
                get_Tree(): any;
                get_Count(): number;
                get_IsEmpty(): boolean;
                get_Item(k: _T1): _T2;
            }
            interface FSharpSet<_T1> {
                add(x: __ABBREV.__Collections.FSharpSet<_T1>): __ABBREV.__Collections.FSharpSet<_T1>;
                sub(x: __ABBREV.__Collections.FSharpSet<_T1>): __ABBREV.__Collections.FSharpSet<_T1>;
                Add(x: _T1): __ABBREV.__Collections.FSharpSet<_T1>;
                Contains(v: _T1): boolean;
                IsProperSubsetOf(s: __ABBREV.__Collections.FSharpSet<_T1>): boolean;
                IsProperSupersetOf(s: __ABBREV.__Collections.FSharpSet<_T1>): boolean;
                IsSubsetOf(s: __ABBREV.__Collections.FSharpSet<_T1>): boolean;
                IsSupersetOf(s: __ABBREV.__Collections.FSharpSet<_T1>): boolean;
                Remove(v: _T1): __ABBREV.__Collections.FSharpSet<_T1>;
                GetEnumerator(): __ABBREV.__WebSharper.IEnumeratorProxy<_T1>;
                GetHashCode(): number;
                Equals(other: __ABBREV.__WebSharper.ObjectProxy): boolean;
                CompareTo(other: __ABBREV.__WebSharper.ObjectProxy): number;
                get_Count(): number;
                get_IsEmpty(): boolean;
                get_Tree(): any;
                get_MaximumElement(): _T1;
                get_MinimumElement(): _T1;
            }
        }
    }
}
declare module __ABBREV {
    
    export import __LinkedList = IntelliFactory.WebSharper.Collections.LinkedList;
    export import __WebSharper = IntelliFactory.WebSharper;
    export import __ResizeArray = IntelliFactory.WebSharper.Collections.ResizeArray;
    export import __Collections = IntelliFactory.WebSharper.Collections;
}

declare module IntelliFactory {
    module Reactive {
        module HotStream {
            var New1 : {
                (): __ABBREV.__Reactive.HotStream<any>;
            };
            var New : {
                <_M1>(x: any): __ABBREV.__Reactive.HotStream<any>;
            };
        }
        module Reactive {
            var Return : {
                <_M1>(x: _M1): __ABBREV.__Control.IObservableProxy<_M1>;
            };
            var Never : {
                <_M1>(): __ABBREV.__Control.IObservableProxy<_M1>;
            };
            var Select : {
                <_M1, _M2>(io: __ABBREV.__Control.IObservableProxy<_M1>, f: {
                    (x: _M1): _M2;
                }): __ABBREV.__Control.IObservableProxy<_M2>;
            };
            var Where : {
                <_M1>(io: __ABBREV.__Control.IObservableProxy<_M1>, f: {
                    (x: _M1): boolean;
                }): __ABBREV.__Control.IObservableProxy<_M1>;
            };
            var Choose : {
                <_M1, _M2>(io: __ABBREV.__Control.IObservableProxy<_M1>, f: {
                    (x: _M1): __ABBREV.__WebSharper.OptionProxy<_M2>;
                }): __ABBREV.__Control.IObservableProxy<_M2>;
            };
            var Drop : {
                <_M1>(io: __ABBREV.__Control.IObservableProxy<_M1>, count: number): __ABBREV.__Control.IObservableProxy<_M1>;
            };
            var Merge : {
                <_M1>(io1: __ABBREV.__Control.IObservableProxy<_M1>, io2: __ABBREV.__Control.IObservableProxy<_M1>): __ABBREV.__Control.IObservableProxy<_M1>;
            };
            var Concat : {
                <_M1>(io1: __ABBREV.__Control.IObservableProxy<_M1>, io2: __ABBREV.__Control.IObservableProxy<_M1>): __ABBREV.__Control.IObservableProxy<_M1>;
            };
            var Range : {
                (start: number, count: number): __ABBREV.__Control.IObservableProxy<number>;
            };
            var CombineLatest : {
                <_M1, _M2, _M3>(io1: __ABBREV.__Control.IObservableProxy<_M1>, io2: __ABBREV.__Control.IObservableProxy<_M2>, f: {
                    (x: _M1): {
                        (x: _M2): _M3;
                    };
                }): __ABBREV.__Control.IObservableProxy<_M3>;
            };
            var Switch : {
                <_M1>(io: __ABBREV.__Control.IObservableProxy<__ABBREV.__Control.IObservableProxy<_M1>>): __ABBREV.__Control.IObservableProxy<_M1>;
            };
            var SelectMany : {
                <_M1>(io: __ABBREV.__Control.IObservableProxy<__ABBREV.__Control.IObservableProxy<_M1>>): __ABBREV.__Control.IObservableProxy<_M1>;
            };
            var Aggregate : {
                <_M1, _M2>(io: __ABBREV.__Control.IObservableProxy<_M1>, seed: _M2, acc: {
                    (x: _M2): {
                        (x: _M1): _M2;
                    };
                }): __ABBREV.__Control.IObservableProxy<_M2>;
            };
            var CollectLatest : {
                <_M1>(outer: __ABBREV.__Control.IObservableProxy<__ABBREV.__Control.IObservableProxy<_M1>>): __ABBREV.__Control.IObservableProxy<__ABBREV.__WebSharper.seq<_M1>>;
            };
            var Sequence : {
                <_M1>(ios: __ABBREV.__WebSharper.seq<__ABBREV.__Control.IObservableProxy<_M1>>): __ABBREV.__Control.IObservableProxy<__ABBREV.__WebSharper.seq<_M1>>;
            };
            var Heat : {
                <_M1>(io: __ABBREV.__Control.IObservableProxy<_M1>): __ABBREV.__Control.IObservableProxy<_M1>;
            };
            var Default : {
                (): __ABBREV.__Reactive.IReactive;
            };
        }
        interface IReactive {
            Return<_M1>(x0: _M1): __ABBREV.__Control.IObservableProxy<_M1>;
            Never<_M1>(): __ABBREV.__Control.IObservableProxy<_M1>;
            Select<_M1, _M2>(x0: __ABBREV.__Control.IObservableProxy<_M1>, x1: {
                (x: _M1): _M2;
            }): __ABBREV.__Control.IObservableProxy<_M2>;
            Concat<_M1>(x0: __ABBREV.__Control.IObservableProxy<_M1>, x1: __ABBREV.__Control.IObservableProxy<_M1>): __ABBREV.__Control.IObservableProxy<_M1>;
            Merge<_M1>(x0: __ABBREV.__Control.IObservableProxy<_M1>, x1: __ABBREV.__Control.IObservableProxy<_M1>): __ABBREV.__Control.IObservableProxy<_M1>;
            Switch<_M1>(x0: __ABBREV.__Control.IObservableProxy<__ABBREV.__Control.IObservableProxy<_M1>>): __ABBREV.__Control.IObservableProxy<_M1>;
            SelectMany<_M1>(x0: __ABBREV.__Control.IObservableProxy<__ABBREV.__Control.IObservableProxy<_M1>>): __ABBREV.__Control.IObservableProxy<_M1>;
            CollectLatest<_M1>(x0: __ABBREV.__Control.IObservableProxy<__ABBREV.__Control.IObservableProxy<_M1>>): __ABBREV.__Control.IObservableProxy<__ABBREV.__WebSharper.seq<_M1>>;
            CombineLatest<_M1, _M2, _M3>(x0: __ABBREV.__Control.IObservableProxy<_M1>, x1: __ABBREV.__Control.IObservableProxy<_M2>, x2: {
                (x: _M1): {
                    (x: _M2): _M3;
                };
            }): __ABBREV.__Control.IObservableProxy<_M3>;
            Heat<_M1>(x0: __ABBREV.__Control.IObservableProxy<_M1>): __ABBREV.__Control.IObservableProxy<_M1>;
            Aggregate<_M1, _M2>(x0: __ABBREV.__Control.IObservableProxy<_M1>, x1: _M2, x2: {
                (x: _M2): {
                    (x: _M1): _M2;
                };
            }): __ABBREV.__Control.IObservableProxy<_M2>;
            Choose<_M1, _M2>(x0: __ABBREV.__Control.IObservableProxy<_M1>, x1: {
                (x: _M1): __ABBREV.__WebSharper.OptionProxy<_M2>;
            }): __ABBREV.__Control.IObservableProxy<_M2>;
            Where<_M1>(x0: __ABBREV.__Control.IObservableProxy<_M1>, x1: {
                (x: _M1): boolean;
            }): __ABBREV.__Control.IObservableProxy<_M1>;
            Drop<_M1>(x0: __ABBREV.__Control.IObservableProxy<_M1>, x1: number): __ABBREV.__Control.IObservableProxy<_M1>;
            Sequence<_M1>(x0: __ABBREV.__WebSharper.seq<__ABBREV.__Control.IObservableProxy<_M1>>): __ABBREV.__Control.IObservableProxy<__ABBREV.__WebSharper.seq<_M1>>;
        }
        interface HotStream<_T1> {
            Trigger(v: _T1): void;
            Subscribe(o: __ABBREV.__Control.IObserverProxy<_T1>): __ABBREV.__WebSharper.IDisposableProxy;
            Latest: __ABBREV.__WebSharper.ref<__ABBREV.__WebSharper.OptionProxy<_T1>>;
            Event: __ABBREV.__Control.FSharpEvent<_T1>;
        }
    }
}
declare module __ABBREV {
    
    export import __Reactive = IntelliFactory.Reactive;
    export import __Control = IntelliFactory.WebSharper.Control;
    export import __WebSharper = IntelliFactory.WebSharper;
}

declare module IntelliFactory {
    module Formlet {
        module Base {
            module Tree {
                interface Edit<_T1> {
                    GetEnumerator(): __ABBREV.__WebSharper.IEnumeratorProxy1;
                    GetEnumerator1(): __ABBREV.__WebSharper.IEnumeratorProxy<_T1>;
                    get_Sequence(): __ABBREV.__WebSharper.seq<_T1>;
                }
                interface Tree<_T1> {
                    Map<_M1>(f: {
                        (x: _T1): _M1;
                    }): __ABBREV.__Tree.Tree<_M1>;
                    GetEnumerator(): __ABBREV.__WebSharper.IEnumeratorProxy1;
                    GetEnumerator1(): __ABBREV.__WebSharper.IEnumeratorProxy<_T1>;
                    get_Sequence(): __ABBREV.__WebSharper.seq<_T1>;
                }
                var ShowEdit : {
                    <_M1>(edit: __ABBREV.__Tree.Edit<_M1>): string;
                };
                var Count : {
                    <_M1>(t: __ABBREV.__Tree.Tree<_M1>): number;
                };
                var Range : {
                    <_M1>(edit: __ABBREV.__Tree.Edit<_M1>, input: __ABBREV.__Tree.Tree<_M1>): any;
                };
                var FromSequence : {
                    <_M1>(vs: __ABBREV.__WebSharper.seq<_M1>): __ABBREV.__Tree.Tree<_M1>;
                };
                var ReplacedTree : {
                    <_M1>(edit: __ABBREV.__Tree.Edit<_M1>, input: __ABBREV.__Tree.Tree<_M1>): __ABBREV.__Tree.Tree<_M1>;
                };
                var Apply : {
                    <_M1>(edit: __ABBREV.__Tree.Edit<_M1>, input: __ABBREV.__Tree.Tree<_M1>): __ABBREV.__Tree.Tree<_M1>;
                };
                var Set : {
                    <_M1>(value: _M1): __ABBREV.__Tree.Edit<_M1>;
                };
                var Transform : {
                    <_M1, _M2>(f: {
                        (x: __ABBREV.__Tree.Tree<_M1>): __ABBREV.__Tree.Tree<_M2>;
                    }, edit: __ABBREV.__Tree.Edit<_M1>): __ABBREV.__Tree.Edit<_M2>;
                };
                var Delete : {
                    <_M1>(): __ABBREV.__Tree.Edit<_M1>;
                };
                var FlipEdit : {
                    <_M1>(edit: __ABBREV.__Tree.Edit<_M1>): __ABBREV.__Tree.Edit<_M1>;
                };
                var DeepFlipEdit : {
                    <_M1>(edit: __ABBREV.__Tree.Edit<_M1>): __ABBREV.__Tree.Edit<_M1>;
                };
            }
            module Result {
                var Join : {
                    (res: __ABBREV.__Base.Result<__ABBREV.__Base.Result<any>>): __ABBREV.__Base.Result<any>;
                };
                var Apply : {
                    <_M1>(f: __ABBREV.__Base.Result<{
                        (x: any): _M1;
                    }>, r: __ABBREV.__Base.Result<any>): __ABBREV.__Base.Result<_M1>;
                };
                var OfOption : {
                    (o: __ABBREV.__WebSharper.OptionProxy<any>): __ABBREV.__Base.Result<any>;
                };
                var Map : {
                    <_M1>(f: {
                        (x: any): _M1;
                    }, res: __ABBREV.__Base.Result<any>): __ABBREV.__Base.Result<_M1>;
                };
                var Sequence : {
                    (rs: __ABBREV.__WebSharper.seq<__ABBREV.__Base.Result<any>>): __ABBREV.__Base.Result<__ABBREV.__List.T<any>>;
                };
            }
            interface Layout<_T1> {
                Apply: {
                    (x: any): __ABBREV.__WebSharper.OptionProxy<any>;
                };
            }
            interface Container<_T1> {
                Body: _T1;
                SyncRoot: __ABBREV.__WebSharper.ObjectProxy;
                Insert: {
                    (x: number): {
                        (x: _T1): void;
                    };
                };
                Remove: {
                    (x: __ABBREV.__WebSharper.seq<_T1>): void;
                };
            }
            interface Reactive {
                Reactive: __ABBREV.__Reactive.IReactive;
            }
            interface LayoutUtils {
                Default<_M1>(): any;
                Delay<_M1>(f: {
                    (): any;
                }): any;
                New<_M1>(container: {
                    (): any;
                }): any;
            }
            interface Result<_T1> {
            }
            interface Form<_T1, _T2> {
                Dispose(): void;
                Body: any;
                Dispose1: {
                    (): void;
                };
                Notify: {
                    (x: __ABBREV.__WebSharper.ObjectProxy): void;
                };
                State: any;
            }
            interface IFormlet<_T1, _T2> {
                Build(): __ABBREV.__Base.Form<_T1, _T2>;
                MapResult<_M1>(x0: {
                    (x: __ABBREV.__Base.Result<_T2>): __ABBREV.__Base.Result<_M1>;
                }): __ABBREV.__Base.IFormlet<_T1, _T2>;
                get_Layout(): any;
            }
            interface Utils<_T1> {
                Reactive: __ABBREV.__Reactive.IReactive;
                DefaultLayout: any;
            }
            interface FormletProvider<_T1> {
                BuildForm<_M1>(formlet: __ABBREV.__Base.IFormlet<_T1, _M1>): __ABBREV.__Base.Form<_T1, _M1>;
                New<_M1>(build: {
                    (): __ABBREV.__Base.Form<_T1, _M1>;
                }): __ABBREV.__Base.IFormlet<_T1, _M1>;
                FromState<_M1>(state: any): __ABBREV.__Base.IFormlet<_T1, _M1>;
                WithLayout<_M1>(layout: any, formlet: __ABBREV.__Base.IFormlet<_T1, _M1>): __ABBREV.__Base.IFormlet<_T1, _M1>;
                InitWith<_M1>(value: _M1, formlet: __ABBREV.__Base.IFormlet<_T1, _M1>): __ABBREV.__Base.IFormlet<_T1, _M1>;
                ReplaceFirstWithFailure<_M1>(formlet: __ABBREV.__Base.IFormlet<_T1, _M1>): __ABBREV.__Base.IFormlet<_T1, _M1>;
                InitWithFailure<_M1>(formlet: __ABBREV.__Base.IFormlet<_T1, _M1>): __ABBREV.__Base.IFormlet<_T1, _M1>;
                ApplyLayout<_M1>(formlet: __ABBREV.__Base.IFormlet<_T1, _M1>): __ABBREV.__Base.IFormlet<_T1, _M1>;
                AppendLayout<_M1>(layout: any, formlet: __ABBREV.__Base.IFormlet<_T1, _M1>): __ABBREV.__Base.IFormlet<_T1, _M1>;
                MapBody<_M1>(f: {
                    (x: _T1): _T1;
                }, formlet: __ABBREV.__Base.IFormlet<_T1, _M1>): __ABBREV.__Base.IFormlet<_T1, _M1>;
                WithLayoutOrDefault<_M1>(formlet: __ABBREV.__Base.IFormlet<_T1, _M1>): __ABBREV.__Base.IFormlet<_T1, _M1>;
                MapResult<_M1, _M2>(f: {
                    (x: __ABBREV.__Base.Result<_M1>): __ABBREV.__Base.Result<_M2>;
                }, formlet: __ABBREV.__Base.IFormlet<_T1, _M1>): __ABBREV.__Base.IFormlet<_T1, _M2>;
                Map<_M1, _M2>(f: {
                    (x: _M1): _M2;
                }, formlet: __ABBREV.__Base.IFormlet<_T1, _M1>): __ABBREV.__Base.IFormlet<_T1, _M2>;
                Apply<_M1, _M2>(f: __ABBREV.__Base.IFormlet<_T1, {
                    (x: _M1): _M2;
                }>, x: __ABBREV.__Base.IFormlet<_T1, _M1>): __ABBREV.__Base.IFormlet<_T1, _M2>;
                Return<_M1>(x: _M1): __ABBREV.__Base.IFormlet<_T1, _M1>;
                Fail<_M1>(fs: __ABBREV.__List.T<string>): __ABBREV.__Base.Form<_T1, _M1>;
                FailWith<_M1>(fs: __ABBREV.__List.T<string>): __ABBREV.__Base.IFormlet<_T1, _M1>;
                ReturnEmpty<_M1>(x: _M1): __ABBREV.__Base.IFormlet<_T1, _M1>;
                Never<_M1>(): __ABBREV.__Base.IFormlet<_T1, _M1>;
                Empty<_M1>(): __ABBREV.__Base.IFormlet<_T1, _M1>;
                EmptyForm<_M1>(): __ABBREV.__Base.Form<_T1, _M1>;
                Join<_M1>(formlet: __ABBREV.__Base.IFormlet<_T1, __ABBREV.__Base.IFormlet<_T1, _M1>>): __ABBREV.__Base.IFormlet<_T1, _M1>;
                Switch<_M1>(formlet: __ABBREV.__Base.IFormlet<_T1, __ABBREV.__Base.IFormlet<_T1, _M1>>): __ABBREV.__Base.IFormlet<_T1, _M1>;
                FlipBody<_M1>(formlet: __ABBREV.__Base.IFormlet<_T1, _M1>): __ABBREV.__Base.IFormlet<_T1, _M1>;
                SelectMany<_M1>(formlet: __ABBREV.__Base.IFormlet<_T1, __ABBREV.__Base.IFormlet<_T1, _M1>>): __ABBREV.__Base.IFormlet<_T1, __ABBREV.__List.T<_M1>>;
                WithNotificationChannel<_M1>(formlet: __ABBREV.__Base.IFormlet<_T1, _M1>): __ABBREV.__Base.IFormlet<_T1, any>;
                Replace<_M1, _M2>(formlet: __ABBREV.__Base.IFormlet<_T1, _M1>, f: {
                    (x: _M1): __ABBREV.__Base.IFormlet<_T1, _M2>;
                }): __ABBREV.__Base.IFormlet<_T1, _M2>;
                Deletable<_M1>(formlet: __ABBREV.__Base.IFormlet<_T1, __ABBREV.__WebSharper.OptionProxy<_M1>>): __ABBREV.__Base.IFormlet<_T1, __ABBREV.__WebSharper.OptionProxy<_M1>>;
                WithCancelation<_M1>(formlet: __ABBREV.__Base.IFormlet<_T1, _M1>, cancelFormlet: __ABBREV.__Base.IFormlet<_T1, void>): __ABBREV.__Base.IFormlet<_T1, __ABBREV.__WebSharper.OptionProxy<_M1>>;
                Bind<_M1, _M2>(formlet: __ABBREV.__Base.IFormlet<_T1, _M1>, f: {
                    (x: _M1): __ABBREV.__Base.IFormlet<_T1, _M2>;
                }): __ABBREV.__Base.IFormlet<_T1, _M2>;
                Delay<_M1>(f: {
                    (): __ABBREV.__Base.IFormlet<_T1, _M1>;
                }): __ABBREV.__Base.IFormlet<_T1, _M1>;
                Sequence<_M1, _M2>(fs: __ABBREV.__WebSharper.seq<__ABBREV.__Base.IFormlet<_T1, _M2>>): __ABBREV.__Base.IFormlet<_T1, __ABBREV.__List.T<_M2>>;
                LiftResult<_M1>(formlet: __ABBREV.__Base.IFormlet<_T1, _M1>): __ABBREV.__Base.IFormlet<_T1, __ABBREV.__Base.Result<_M1>>;
                WithNotification<_M1>(notify: {
                    (x: __ABBREV.__WebSharper.ObjectProxy): void;
                }, formlet: __ABBREV.__Base.IFormlet<_T1, _M1>): __ABBREV.__Base.IFormlet<_T1, _M1>;
                BindWith<_M1, _M2>(hF: {
                    (x: _T1): {
                        (x: _T1): _T1;
                    };
                }, formlet: __ABBREV.__Base.IFormlet<_T1, _M1>, f: {
                    (x: _M1): __ABBREV.__Base.IFormlet<_T1, _M2>;
                }): __ABBREV.__Base.IFormlet<_T1, _M2>;
            }
            interface FormletBuilder<_T1> {
                Return<_M1>(x: _M1): __ABBREV.__Base.IFormlet<_T1, _M1>;
                Bind<_M1, _M2>(x: __ABBREV.__Base.IFormlet<_T1, _M1>, f: {
                    (x: _M1): __ABBREV.__Base.IFormlet<_T1, _M2>;
                }): __ABBREV.__Base.IFormlet<_T1, _M2>;
                Delay<_M1>(f: {
                    (): __ABBREV.__Base.IFormlet<_T1, _M1>;
                }): __ABBREV.__Base.IFormlet<_T1, _M1>;
                ReturnFrom<_M1>(f: _M1): _M1;
            }
            interface IValidatorProvider {
                Matches(x0: string, x1: string): boolean;
            }
            interface Validator {
                Validate<_M1, _M2, _M3>(f: {
                    (x: _M2): boolean;
                }, msg: string, flet: _M3): _M3;
                Is<_M1, _M2, _M3>(f: {
                    (x: _M1): boolean;
                }, m: string, flet: _M2): _M2;
                IsNotEmpty<_M1, _M2>(msg: string, flet: _M2): _M2;
                IsRegexMatch<_M1, _M2>(regex: string, msg: string, flet: _M1): _M1;
                IsEmail<_M1, _M2>(msg: string): {
                    (x: _M1): _M1;
                };
                IsInt<_M1, _M2>(msg: string): {
                    (x: _M1): _M1;
                };
                IsFloat<_M1, _M2>(msg: string): {
                    (x: _M1): _M1;
                };
                IsTrue<_M1, _M2>(msg: string, flet: _M1): _M1;
                IsGreaterThan<_M1, _M2, _M3>(min: _M1, msg: string, flet: _M2): _M2;
                IsLessThan<_M1, _M2, _M3>(max: _M1, msg: string, flet: _M2): _M2;
                IsEqual<_M1, _M2, _M3>(value: _M1, msg: string, flet: _M2): _M2;
                IsNotEqual<_M1, _M2, _M3>(value: _M1, msg: string, flet: _M2): _M2;
            }
        }
    }
}
declare module __ABBREV {
    
    export import __WebSharper = IntelliFactory.WebSharper;
    export import __Tree = IntelliFactory.Formlet.Base.Tree;
    export import __Base = IntelliFactory.Formlet.Base;
    export import __List = IntelliFactory.WebSharper.List;
    export import __Reactive = IntelliFactory.Reactive;
}

declare module IntelliFactory {
    module WebSharper {
        module Formlet {
            module Body {
                var New : {
                    (el: __ABBREV.__Html.Element, l: __ABBREV.__WebSharper.OptionProxy<{
                        (): __ABBREV.__Html.Element;
                    }>): __ABBREV.__Formlet.Body;
                };
            }
            module Layout {
                module Padding {
                    var get_Default : {
                        (): __ABBREV.__Layout.Padding;
                    };
                }
                module LabelConfiguration {
                    var get_Default : {
                        (): __ABBREV.__Layout.LabelConfiguration;
                    };
                }
                module FormRowConfiguration {
                    var get_Default : {
                        (): __ABBREV.__Layout.FormRowConfiguration;
                    };
                }
                interface Align {
                }
                interface VerticalAlign {
                }
                interface FormRowConfiguration {
                    Padding: __ABBREV.__WebSharper.OptionProxy<__ABBREV.__Layout.Padding>;
                    Color: __ABBREV.__WebSharper.OptionProxy<{
                        (x: number): string;
                    }>;
                    Class: __ABBREV.__WebSharper.OptionProxy<{
                        (x: number): string;
                    }>;
                    Style: __ABBREV.__WebSharper.OptionProxy<{
                        (x: number): string;
                    }>;
                    LabelConfiguration: __ABBREV.__WebSharper.OptionProxy<__ABBREV.__Layout.LabelConfiguration>;
                }
                interface LabelConfiguration {
                    Align: __ABBREV.__Layout.Align;
                    VerticalAlign: __ABBREV.__Layout.VerticalAlign;
                    Placement: __ABBREV.__Layout.Placement;
                }
                interface Padding {
                    Left: __ABBREV.__WebSharper.OptionProxy<number>;
                    Right: __ABBREV.__WebSharper.OptionProxy<number>;
                    Top: __ABBREV.__WebSharper.OptionProxy<number>;
                    Bottom: __ABBREV.__WebSharper.OptionProxy<number>;
                }
                interface Placement {
                }
            }
            module Data {
                interface Formlet<_T1> {
                    Run(f: {
                        (x: _T1): void;
                    }): __ABBREV.__Html.IPagelet;
                    Build(): __ABBREV.__Base.Form<__ABBREV.__Formlet.Body, _T1>;
                    get_Layout(): any;
                    MapResult<_M1>(f: {
                        (x: __ABBREV.__Base.Result<_T1>): __ABBREV.__Base.Result<_M1>;
                    }): __ABBREV.__Base.IFormlet<__ABBREV.__Formlet.Body, _T1>;
                    get_Body(): __ABBREV.__Dom.Node;
                    Render(): void;
                    BuildInternal: {
                        (): __ABBREV.__Base.Form<__ABBREV.__Formlet.Body, _T1>;
                    };
                    LayoutInternal: any;
                    ElementInternal: __ABBREV.__WebSharper.OptionProxy<__ABBREV.__Html.Element>;
                    FormletBase: __ABBREV.__Base.FormletProvider<__ABBREV.__Formlet.Body>;
                    Utils: any;
                }
                var NewBody : {
                    (arg00: __ABBREV.__Html.Element, arg10: __ABBREV.__WebSharper.OptionProxy<{
                        (): __ABBREV.__Html.Element;
                    }>): __ABBREV.__Formlet.Body;
                };
                var UtilsProvider : {
                    (): any;
                };
                var BaseFormlet : {
                    (): __ABBREV.__Base.FormletProvider<__ABBREV.__Formlet.Body>;
                };
                var PropagateRenderFrom : {
                    <_M1, _M2, _M3>(f1: __ABBREV.__Base.IFormlet<_M1, _M2>, f2: _M3): _M3;
                };
                var OfIFormlet : {
                    <_M1>(formlet: __ABBREV.__Base.IFormlet<__ABBREV.__Formlet.Body, _M1>): __ABBREV.__Data.Formlet<_M1>;
                };
                var MkFormlet : {
                    <_M1, _M2, _M3>(f: {
                        (): any;
                    }): __ABBREV.__Data.Formlet<_M3>;
                };
                var $ : {
                    <_M1, _M2>(f: __ABBREV.__Data.Formlet<{
                        (x: _M1): _M2;
                    }>, x: __ABBREV.__Data.Formlet<_M1>): __ABBREV.__Data.Formlet<_M2>;
                };
                var RX : {
                    (): __ABBREV.__Reactive.IReactive;
                };
                var Layout : {
                    (): __ABBREV.__Formlet.LayoutProvider;
                };
                var DefaultLayout : {
                    (): any;
                };
                var Validator : {
                    (): __ABBREV.__Base.Validator;
                };
            }
            module Enhance {
                module FormButtonConfiguration {
                    var get_Default : {
                        (): __ABBREV.__Enhance.FormButtonConfiguration;
                    };
                }
                module ValidationIconConfiguration {
                    var get_Default : {
                        (): __ABBREV.__Enhance.ValidationIconConfiguration;
                    };
                }
                module ValidationFrameConfiguration {
                    var get_Default : {
                        (): __ABBREV.__Enhance.ValidationFrameConfiguration;
                    };
                }
                module Padding {
                    var get_Default : {
                        (): __ABBREV.__Enhance.Padding;
                    };
                }
                module FormContainerConfiguration {
                    var get_Default : {
                        (): __ABBREV.__Enhance.FormContainerConfiguration;
                    };
                }
                module ManyConfiguration {
                    var get_Default : {
                        (): __ABBREV.__Enhance.ManyConfiguration;
                    };
                }
                interface FormButtonConfiguration {
                    Label: __ABBREV.__WebSharper.OptionProxy<string>;
                    Style: __ABBREV.__WebSharper.OptionProxy<string>;
                    Class: __ABBREV.__WebSharper.OptionProxy<string>;
                }
                interface ValidationIconConfiguration {
                    ValidIconClass: string;
                    ErrorIconClass: string;
                }
                interface ValidationFrameConfiguration {
                    ValidClass: __ABBREV.__WebSharper.OptionProxy<string>;
                    ValidStyle: __ABBREV.__WebSharper.OptionProxy<string>;
                    ErrorClass: __ABBREV.__WebSharper.OptionProxy<string>;
                    ErrorStyle: __ABBREV.__WebSharper.OptionProxy<string>;
                }
                interface Padding {
                    Left: __ABBREV.__WebSharper.OptionProxy<number>;
                    Right: __ABBREV.__WebSharper.OptionProxy<number>;
                    Top: __ABBREV.__WebSharper.OptionProxy<number>;
                    Bottom: __ABBREV.__WebSharper.OptionProxy<number>;
                }
                interface FormPart {
                }
                interface FormContainerConfiguration {
                    Header: __ABBREV.__WebSharper.OptionProxy<__ABBREV.__Enhance.FormPart>;
                    Padding: __ABBREV.__Enhance.Padding;
                    Description: __ABBREV.__WebSharper.OptionProxy<__ABBREV.__Enhance.FormPart>;
                    BackgroundColor: __ABBREV.__WebSharper.OptionProxy<string>;
                    BorderColor: __ABBREV.__WebSharper.OptionProxy<string>;
                    CssClass: __ABBREV.__WebSharper.OptionProxy<string>;
                    Style: __ABBREV.__WebSharper.OptionProxy<string>;
                }
                interface ManyConfiguration {
                    AddIconClass: string;
                    RemoveIconClass: string;
                }
                interface JsonPostConfiguration {
                    PostUrl: __ABBREV.__WebSharper.OptionProxy<string>;
                    ParameterName: string;
                    EncodingType: __ABBREV.__WebSharper.OptionProxy<string>;
                }
                var WithResetFormlet : {
                    <_M1, _M2>(formlet: __ABBREV.__Data.Formlet<_M1>, reset: __ABBREV.__Data.Formlet<_M2>): __ABBREV.__Data.Formlet<_M1>;
                };
                var WithResetAction : {
                    <_M1>(f: {
                        (): boolean;
                    }, formlet: __ABBREV.__Data.Formlet<_M1>): __ABBREV.__Data.Formlet<_M1>;
                };
                var WithSubmitFormlet : {
                    <_M1>(formlet: __ABBREV.__Data.Formlet<_M1>, submit: {
                        (x: __ABBREV.__Base.Result<_M1>): __ABBREV.__Data.Formlet<void>;
                    }): __ABBREV.__Data.Formlet<_M1>;
                };
                var WithSubmitAndReset : {
                    <_M1, _M2>(formlet: __ABBREV.__Data.Formlet<_M1>, submReset: {
                        (x: {
                            (): void;
                        }): {
                            (x: __ABBREV.__Base.Result<_M1>): __ABBREV.__Data.Formlet<_M2>;
                        };
                    }): __ABBREV.__Data.Formlet<_M2>;
                };
                var InputButton : {
                    (conf: __ABBREV.__Enhance.FormButtonConfiguration, enabled: boolean): __ABBREV.__Data.Formlet<number>;
                };
                var WithCustomSubmitAndResetButtons : {
                    <_M1>(submitConf: __ABBREV.__Enhance.FormButtonConfiguration, resetConf: __ABBREV.__Enhance.FormButtonConfiguration, formlet: __ABBREV.__Data.Formlet<_M1>): __ABBREV.__Data.Formlet<_M1>;
                };
                var WithSubmitAndResetButtons : {
                    <_M1>(formlet: __ABBREV.__Data.Formlet<_M1>): __ABBREV.__Data.Formlet<_M1>;
                };
                var WithCustomValidationIcon : {
                    <_M1>(vic: __ABBREV.__Enhance.ValidationIconConfiguration, formlet: __ABBREV.__Data.Formlet<_M1>): __ABBREV.__Data.Formlet<_M1>;
                };
                var WithValidationIcon : {
                    <_M1>(formlet: __ABBREV.__Data.Formlet<_M1>): __ABBREV.__Data.Formlet<_M1>;
                };
                var WrapFormlet : {
                    <_M1>(wrapper: {
                        (x: __ABBREV.__Control.IObservableProxy<__ABBREV.__Base.Result<_M1>>): {
                            (x: __ABBREV.__Formlet.Body): __ABBREV.__Html.Element;
                        };
                    }, formlet: __ABBREV.__Data.Formlet<_M1>): __ABBREV.__Data.Formlet<_M1>;
                };
                var WithCustomValidationFrame : {
                    <_M1>(vc: __ABBREV.__Enhance.ValidationFrameConfiguration, formlet: __ABBREV.__Data.Formlet<_M1>): __ABBREV.__Data.Formlet<_M1>;
                };
                var WithCustomResetButton : {
                    <_M1>(buttonConf: __ABBREV.__Enhance.FormButtonConfiguration, formlet: __ABBREV.__Data.Formlet<_M1>): __ABBREV.__Data.Formlet<_M1>;
                };
                var WithResetButton : {
                    <_M1>(formlet: __ABBREV.__Data.Formlet<_M1>): __ABBREV.__Data.Formlet<_M1>;
                };
                var WithCustomSubmitButton : {
                    <_M1>(buttonConf: __ABBREV.__Enhance.FormButtonConfiguration, formlet: __ABBREV.__Data.Formlet<_M1>): __ABBREV.__Data.Formlet<_M1>;
                };
                var WithSubmitButton : {
                    <_M1>(formlet: __ABBREV.__Data.Formlet<_M1>): __ABBREV.__Data.Formlet<_M1>;
                };
                var WithErrorSummary : {
                    <_M1>(label: string, formlet: __ABBREV.__Data.Formlet<_M1>): __ABBREV.__Data.Formlet<_M1>;
                };
                var WithValidationFrame : {
                    <_M1>(formlet: __ABBREV.__Data.Formlet<_M1>): __ABBREV.__Data.Formlet<_M1>;
                };
                var WithErrorFormlet : {
                    <_M1, _M2>(f: {
                        (x: __ABBREV.__List.T<string>): __ABBREV.__Data.Formlet<_M1>;
                    }, formlet: __ABBREV.__Data.Formlet<_M2>): __ABBREV.__Data.Formlet<_M2>;
                };
                var WithLabel : {
                    <_M1>(labelGen: {
                        (): __ABBREV.__Html.Element;
                    }, formlet: __ABBREV.__Data.Formlet<_M1>): __ABBREV.__Data.Formlet<_M1>;
                };
                var WithLabelConfiguration : {
                    <_M1>(lc: __ABBREV.__Layout.LabelConfiguration, formlet: __ABBREV.__Data.Formlet<_M1>): __ABBREV.__Data.Formlet<_M1>;
                };
                var WithLabelAndInfo : {
                    <_M1>(label: string, info: string, formlet: __ABBREV.__Data.Formlet<_M1>): __ABBREV.__Data.Formlet<_M1>;
                };
                var WithTextLabel : {
                    <_M1>(label: string, formlet: __ABBREV.__Data.Formlet<_M1>): __ABBREV.__Data.Formlet<_M1>;
                };
                var WithLabelAbove : {
                    <_M1>(formlet: __ABBREV.__Data.Formlet<_M1>): __ABBREV.__Data.Formlet<_M1>;
                };
                var WithLabelLeft : {
                    <_M1>(formlet: __ABBREV.__Data.Formlet<_M1>): __ABBREV.__Data.Formlet<_M1>;
                };
                var WithCustomFormContainer : {
                    <_M1>(fc: __ABBREV.__Enhance.FormContainerConfiguration, formlet: __ABBREV.__Data.Formlet<_M1>): __ABBREV.__Data.Formlet<_M1>;
                };
                var WithFormContainer : {
                    <_M1>(formlet: __ABBREV.__Data.Formlet<_M1>): __ABBREV.__Data.Formlet<_M1>;
                };
                var WithCssClass : {
                    <_M1>(css: string, formlet: __ABBREV.__Data.Formlet<_M1>): __ABBREV.__Data.Formlet<_M1>;
                };
                var WithLegend : {
                    <_M1>(label: string, formlet: __ABBREV.__Data.Formlet<_M1>): __ABBREV.__Data.Formlet<_M1>;
                };
                var WithRowConfiguration : {
                    <_M1>(rc: __ABBREV.__Layout.FormRowConfiguration, formlet: __ABBREV.__Data.Formlet<_M1>): __ABBREV.__Data.Formlet<_M1>;
                };
                var Cancel : {
                    <_M1>(formlet: __ABBREV.__Data.Formlet<_M1>, isCancel: {
                        (x: _M1): boolean;
                    }): __ABBREV.__Data.Formlet<_M1>;
                };
                var Replace : {
                    <_M1, _M2>(formlet: __ABBREV.__Data.Formlet<_M1>, f: {
                        (x: _M1): __ABBREV.__Data.Formlet<_M2>;
                    }): __ABBREV.__Data.Formlet<_M2>;
                };
                var Deletable : {
                    <_M1>(formlet: __ABBREV.__Data.Formlet<__ABBREV.__WebSharper.OptionProxy<_M1>>): __ABBREV.__Data.Formlet<__ABBREV.__WebSharper.OptionProxy<_M1>>;
                };
                var Many_ : {
                    <_M1, _M2>(add: __ABBREV.__Data.Formlet<_M1>, f: {
                        (x: _M1): __ABBREV.__Data.Formlet<__ABBREV.__WebSharper.OptionProxy<_M2>>;
                    }): __ABBREV.__Data.Formlet<__ABBREV.__WebSharper.seq<_M2>>;
                };
                var CustomMany : {
                    <_M1>(config: __ABBREV.__Enhance.ManyConfiguration, formlet: __ABBREV.__Data.Formlet<_M1>): __ABBREV.__Data.Formlet<__ABBREV.__List.T<_M1>>;
                };
                var Many : {
                    <_M1>(formlet: __ABBREV.__Data.Formlet<_M1>): __ABBREV.__Data.Formlet<__ABBREV.__List.T<_M1>>;
                };
                var WithJsonPost : {
                    <_M1>(conf: any, formlet: __ABBREV.__Data.Formlet<_M1>): __ABBREV.__Html.Element;
                };
            }
            module Controls {
                var SelectControl : {
                    <_M1>(readOnly: boolean, def: number, vls: __ABBREV.__List.T<any>): __ABBREV.__Data.Formlet<_M1>;
                };
                var Select : {
                    <_M1>(def: number, vls: __ABBREV.__List.T<any>): __ABBREV.__Data.Formlet<_M1>;
                };
                var ReadOnlySelect : {
                    <_M1>(def: number, vls: __ABBREV.__List.T<any>): __ABBREV.__Data.Formlet<_M1>;
                };
                var InputControl : {
                    (value: string, f: {
                        (x: __ABBREV.__Reactive.HotStream<__ABBREV.__Base.Result<string>>): __ABBREV.__Html.Element;
                    }): __ABBREV.__Data.Formlet<string>;
                };
                var OnTextChange : {
                    (f: {
                        (): void;
                    }, control: __ABBREV.__Html.Element): void;
                };
                var TextAreaControl : {
                    (readOnly: boolean, value: string): __ABBREV.__Data.Formlet<string>;
                };
                var TextArea : {
                    (value: string): __ABBREV.__Data.Formlet<string>;
                };
                var ReadOnlyTextArea : {
                    (value: string): __ABBREV.__Data.Formlet<string>;
                };
                var InputField : {
                    (readOnly: boolean, typ: string, cls: string, value: string): __ABBREV.__Data.Formlet<string>;
                };
                var CheckboxControl : {
                    (readOnly: boolean, def: boolean): __ABBREV.__Data.Formlet<boolean>;
                };
                var Checkbox : {
                    (def: boolean): __ABBREV.__Data.Formlet<boolean>;
                };
                var ReadOnlyCheckbox : {
                    (def: boolean): __ABBREV.__Data.Formlet<boolean>;
                };
                var CheckboxGroupControl : {
                    <_M1>(readOnly: boolean, values: __ABBREV.__List.T<any>): __ABBREV.__Data.Formlet<__ABBREV.__List.T<_M1>>;
                };
                var CheckboxGroup : {
                    <_M1>(values: __ABBREV.__List.T<any>): __ABBREV.__Data.Formlet<__ABBREV.__List.T<_M1>>;
                };
                var RadioButtonGroupControl : {
                    <_M1>(readOnly: boolean, def: __ABBREV.__WebSharper.OptionProxy<number>, values: __ABBREV.__List.T<any>): __ABBREV.__Data.Formlet<_M1>;
                };
                var RadioButtonGroup : {
                    <_M1>(def: __ABBREV.__WebSharper.OptionProxy<number>, values: __ABBREV.__List.T<any>): __ABBREV.__Data.Formlet<_M1>;
                };
                var ReadOnlyRadioButtonGroup : {
                    <_M1>(def: __ABBREV.__WebSharper.OptionProxy<number>, values: __ABBREV.__List.T<any>): __ABBREV.__Data.Formlet<_M1>;
                };
                var Password : {
                    (value: string): __ABBREV.__Data.Formlet<string>;
                };
                var Input : {
                    (value: string): __ABBREV.__Data.Formlet<string>;
                };
                var ReadOnlyInput : {
                    (value: string): __ABBREV.__Data.Formlet<string>;
                };
                var ElementButton : {
                    (genElem: {
                        (): __ABBREV.__Html.Element;
                    }): __ABBREV.__Data.Formlet<number>;
                };
                var Button : {
                    (label: string): __ABBREV.__Data.Formlet<number>;
                };
            }
            module Formlet {
                var BuildFormlet : {
                    <_M1, _M2, _M3>(f: {
                        (): any;
                    }): __ABBREV.__Data.Formlet<_M3>;
                };
                var New : {
                    <_M1>(f: {
                        (): __ABBREV.__Base.Form<__ABBREV.__Formlet.Body, _M1>;
                    }): __ABBREV.__Data.Formlet<_M1>;
                };
                var WithLayoutOrDefault : {
                    <_M1>(formlet: __ABBREV.__Data.Formlet<_M1>): __ABBREV.__Data.Formlet<_M1>;
                };
                var Return : {
                    <_M1>(x: _M1): __ABBREV.__Data.Formlet<_M1>;
                };
                var WithCancelation : {
                    <_M1>(formlet: __ABBREV.__Data.Formlet<_M1>, c: __ABBREV.__Data.Formlet<void>): __ABBREV.__Data.Formlet<__ABBREV.__WebSharper.OptionProxy<_M1>>;
                };
                var InitWith : {
                    <_M1>(value: _M1, formlet: __ABBREV.__Data.Formlet<_M1>): __ABBREV.__Data.Formlet<_M1>;
                };
                var InitWithFailure : {
                    <_M1>(formlet: __ABBREV.__Data.Formlet<_M1>): __ABBREV.__Data.Formlet<_M1>;
                };
                var Horizontal : {
                    <_M1>(formlet: __ABBREV.__Data.Formlet<_M1>): __ABBREV.__Data.Formlet<_M1>;
                };
                var Vertical : {
                    <_M1>(formlet: __ABBREV.__Data.Formlet<_M1>): __ABBREV.__Data.Formlet<_M1>;
                };
                var Flowlet : {
                    <_M1>(formlet: __ABBREV.__Data.Formlet<_M1>): __ABBREV.__Data.Formlet<_M1>;
                };
                var ReplaceFirstWithFailure : {
                    <_M1>(formlet: __ABBREV.__Data.Formlet<_M1>): __ABBREV.__Data.Formlet<_M1>;
                };
                var Never : {
                    <_M1>(): __ABBREV.__Data.Formlet<_M1>;
                };
                var Empty : {
                    <_M1>(): __ABBREV.__Data.Formlet<_M1>;
                };
                var ReturnEmpty : {
                    <_M1>(x: _M1): __ABBREV.__Data.Formlet<_M1>;
                };
                var BuildForm : {
                    <_M1>(f: __ABBREV.__Data.Formlet<_M1>): __ABBREV.__Base.Form<__ABBREV.__Formlet.Body, _M1>;
                };
                var Deletable : {
                    <_M1>(formlet: __ABBREV.__Data.Formlet<__ABBREV.__WebSharper.OptionProxy<_M1>>): __ABBREV.__Data.Formlet<__ABBREV.__WebSharper.OptionProxy<_M1>>;
                };
                var FailWith : {
                    <_M1>(fs: __ABBREV.__List.T<string>): __ABBREV.__Data.Formlet<_M1>;
                };
                var Map : {
                    <_M1, _M2>(f: {
                        (x: _M1): _M2;
                    }, formlet: __ABBREV.__Data.Formlet<_M1>): __ABBREV.__Data.Formlet<_M2>;
                };
                var MapBody : {
                    <_M1>(f: {
                        (x: __ABBREV.__Formlet.Body): __ABBREV.__Formlet.Body;
                    }, formlet: __ABBREV.__Data.Formlet<_M1>): __ABBREV.__Data.Formlet<_M1>;
                };
                var MapResult : {
                    <_M1, _M2>(f: {
                        (x: __ABBREV.__Base.Result<_M1>): __ABBREV.__Base.Result<_M2>;
                    }, formlet: __ABBREV.__Data.Formlet<_M1>): __ABBREV.__Data.Formlet<_M2>;
                };
                var Delay : {
                    <_M1>(f: {
                        (): __ABBREV.__Data.Formlet<_M1>;
                    }): __ABBREV.__Data.Formlet<_M1>;
                };
                var Bind : {
                    <_M1, _M2>(fl: __ABBREV.__Data.Formlet<_M1>, f: {
                        (x: _M1): __ABBREV.__Data.Formlet<_M2>;
                    }): __ABBREV.__Data.Formlet<_M2>;
                };
                var Replace : {
                    <_M1, _M2>(formlet: __ABBREV.__Data.Formlet<_M1>, f: {
                        (x: _M1): __ABBREV.__Data.Formlet<_M2>;
                    }): __ABBREV.__Data.Formlet<_M2>;
                };
                var Join : {
                    <_M1>(formlet: __ABBREV.__Data.Formlet<__ABBREV.__Data.Formlet<_M1>>): __ABBREV.__Data.Formlet<_M1>;
                };
                var Switch : {
                    <_M1>(formlet: __ABBREV.__Data.Formlet<__ABBREV.__Data.Formlet<_M1>>): __ABBREV.__Data.Formlet<_M1>;
                };
                var FlipBody : {
                    <_M1>(formlet: __ABBREV.__Data.Formlet<_M1>): __ABBREV.__Data.Formlet<_M1>;
                };
                var SelectMany : {
                    <_M1>(formlet: __ABBREV.__Data.Formlet<__ABBREV.__Data.Formlet<_M1>>): __ABBREV.__Data.Formlet<__ABBREV.__List.T<_M1>>;
                };
                var LiftResult : {
                    <_M1>(formlet: __ABBREV.__Data.Formlet<_M1>): __ABBREV.__Data.Formlet<__ABBREV.__Base.Result<_M1>>;
                };
                var Sequence : {
                    <_M1>(fs: __ABBREV.__WebSharper.seq<__ABBREV.__Data.Formlet<_M1>>): __ABBREV.__Data.Formlet<__ABBREV.__List.T<_M1>>;
                };
                var WithLayout : {
                    <_M1>(l: any, formlet: __ABBREV.__Data.Formlet<_M1>): __ABBREV.__Data.Formlet<_M1>;
                };
                var WithNotification : {
                    <_M1>(c: {
                        (x: __ABBREV.__WebSharper.ObjectProxy): void;
                    }, formlet: __ABBREV.__Data.Formlet<_M1>): __ABBREV.__Data.Formlet<_M1>;
                };
                var WithNotificationChannel : {
                    <_M1>(formlet: __ABBREV.__Data.Formlet<_M1>): __ABBREV.__Data.Formlet<any>;
                };
                var ApplyLayout : {
                    <_M1>(formlet: __ABBREV.__Data.Formlet<_M1>): __ABBREV.__Data.Formlet<_M1>;
                };
                var MapElement : {
                    <_M1>(f: {
                        (x: __ABBREV.__Html.Element): __ABBREV.__Html.Element;
                    }, formlet: __ABBREV.__Data.Formlet<_M1>): __ABBREV.__Data.Formlet<_M1>;
                };
                var OfElement : {
                    (genElem: {
                        (): __ABBREV.__Html.Element;
                    }): __ABBREV.__Data.Formlet<void>;
                };
                var WithLabel : {
                    <_M1>(label: __ABBREV.__WebSharper.OptionProxy<{
                        (): __ABBREV.__Html.Element;
                    }>, formlet: __ABBREV.__Data.Formlet<_M1>): __ABBREV.__Data.Formlet<_M1>;
                };
                var Run : {
                    <_M1>(f: {
                        (x: _M1): void;
                    }, formlet: __ABBREV.__Data.Formlet<_M1>): __ABBREV.__Html.IPagelet;
                };
                var BindWith : {
                    <_M1, _M2>(compose: {
                        (x: __ABBREV.__Formlet.Body): {
                            (x: __ABBREV.__Formlet.Body): __ABBREV.__Formlet.Body;
                        };
                    }, formlet: __ABBREV.__Data.Formlet<_M1>, f: {
                        (x: _M1): __ABBREV.__Data.Formlet<_M2>;
                    }): __ABBREV.__Data.Formlet<_M2>;
                };
                var Render : {
                    (formlet: __ABBREV.__Data.Formlet<void>): __ABBREV.__Html.IPagelet;
                };
                var Choose : {
                    <_M1>(fs: __ABBREV.__WebSharper.seq<__ABBREV.__Data.Formlet<_M1>>): __ABBREV.__Data.Formlet<_M1>;
                };
                var Do : {
                    (): __ABBREV.__Formlet.FormletBuilder;
                };
            }
            module CssConstants {
                var InputTextClass : {
                    (): string;
                };
            }
            interface Body {
                Element: __ABBREV.__Html.Element;
                Label: __ABBREV.__WebSharper.OptionProxy<{
                    (): __ABBREV.__Html.Element;
                }>;
            }
            interface LayoutProvider {
                HorizontalAlignElem(align: __ABBREV.__Layout.Align, el: __ABBREV.__Html.Element): __ABBREV.__Html.Element;
                VerticalAlignedTD(valign: __ABBREV.__Layout.VerticalAlign, elem: __ABBREV.__Html.Element): __ABBREV.__Html.Element;
                MakeRow(rowConfig: __ABBREV.__Layout.FormRowConfiguration, rowIndex: number, body: __ABBREV.__Formlet.Body): __ABBREV.__Html.Element;
                MakeLayout(lm: {
                    (): any;
                }): any;
                RowLayout(rowConfig: __ABBREV.__Layout.FormRowConfiguration): any;
                ColumnLayout(rowConfig: __ABBREV.__Layout.FormRowConfiguration): any;
                LabelLayout(lc: __ABBREV.__Layout.LabelConfiguration): any;
                get_Flowlet(): any;
                get_Vertical(): any;
                get_Horizontal(): any;
            }
            interface FormletBuilder {
                Return<_M1>(x: _M1): __ABBREV.__Data.Formlet<_M1>;
                Bind<_M1, _M2>(formlet: __ABBREV.__Data.Formlet<_M1>, f: {
                    (x: _M1): __ABBREV.__Data.Formlet<_M2>;
                }): __ABBREV.__Data.Formlet<_M2>;
                Delay<_M1>(f: {
                    (): __ABBREV.__Data.Formlet<_M1>;
                }): __ABBREV.__Data.Formlet<_M1>;
                ReturnFrom<_M1>(f: __ABBREV.__Base.IFormlet<__ABBREV.__Formlet.Body, _M1>): __ABBREV.__Data.Formlet<_M1>;
            }
        }
    }
}
declare module __ABBREV {
    
    export import __Html = IntelliFactory.WebSharper.Html;
    export import __WebSharper = IntelliFactory.WebSharper;
    export import __Formlet = IntelliFactory.WebSharper.Formlet;
    export import __Layout = IntelliFactory.WebSharper.Formlet.Layout;
    export import __Base = IntelliFactory.Formlet.Base;
    export import __Dom = IntelliFactory.WebSharper.Dom;
    export import __Data = IntelliFactory.WebSharper.Formlet.Data;
    export import __Reactive = IntelliFactory.Reactive;
    export import __Enhance = IntelliFactory.WebSharper.Formlet.Enhance;
    export import __Control = IntelliFactory.WebSharper.Control;
    export import __List = IntelliFactory.WebSharper.List;
}

declare module RMECore {
    module Debug {
        var log : {
            <_M1>(message: _M1): void;
        };
        var alert : {
            (message: string): void;
        };
    }
}
declare module __ABBREV {
    
}

declare module RMEPlayer {
    module Client {
        var Main : {
            (): void;
        };
    }
}
declare module __ABBREV {
    
}

