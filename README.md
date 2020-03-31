# ISA_BITS
##### 通过位域实现赋值和取值操作
###### [在objc4-680文件中的objc-private.h源码中](https://opensource.apple.com/tarballs/objc4/)有关于ISA指针的内部实现是通过位域来实现bits的，我们也可以通过这种位域来实现Demo中Teacher里的赋值和取值的操作。
    union isa_t 
    {
        isa_t() { }
        isa_t(uintptr_t value) : bits(value) { }
    
        Class cls;
        uintptr_t bits;
    
    #if SUPPORT_NONPOINTER_ISA
    
        // extra_rc must be the MSB-most field (so it matches carry/overflow flags)
        // indexed must be the LSB (fixme or get rid of it)
        // shiftcls must occupy the same bits that a real class pointer would
        // bits + RC_ONE is equivalent to extra_rc + 1
        // RC_HALF is the high bit of extra_rc (i.e. half of its range)
    
        // future expansion:
        // uintptr_t fast_rr : 1;     // no r/r overrides
        // uintptr_t lock : 2;        // lock for atomic property, @synch
        // uintptr_t extraBytes : 1;  // allocated with extra bytes
    
    # if __arm64__
    #   define ISA_MASK        0x0000000ffffffff8ULL
    #   define ISA_MAGIC_MASK  0x000003f000000001ULL
    #   define ISA_MAGIC_VALUE 0x000001a000000001ULL
        struct {
            uintptr_t indexed           : 1;
            uintptr_t has_assoc         : 1;
            uintptr_t has_cxx_dtor      : 1;
            uintptr_t shiftcls          : 33; // MACH_VM_MAX_ADDRESS 0x1000000000
            uintptr_t magic             : 6;
            uintptr_t weakly_referenced : 1;
            uintptr_t deallocating      : 1;
            uintptr_t has_sidetable_rc  : 1;
            uintptr_t extra_rc          : 19;
    #       define RC_ONE   (1ULL<<45)
    #       define RC_HALF  (1ULL<<18)
        };
    
    # elif __x86_64__
    #   define ISA_MASK        0x00007ffffffffff8ULL
    #   define ISA_MAGIC_MASK  0x001f800000000001ULL
    #   define ISA_MAGIC_VALUE 0x001d800000000001ULL
        struct {
            uintptr_t indexed           : 1;
            uintptr_t has_assoc         : 1;
            uintptr_t has_cxx_dtor      : 1;
            uintptr_t shiftcls          : 44; // MACH_VM_MAX_ADDRESS 0x7fffffe00000
            uintptr_t magic             : 6;
            uintptr_t weakly_referenced : 1;
            uintptr_t deallocating      : 1;
            uintptr_t has_sidetable_rc  : 1;
            uintptr_t extra_rc          : 8;
    #       define RC_ONE   (1ULL<<56)
    #       define RC_HALF  (1ULL<<7)
        };
    
    # else
        // Available bits in isa field are architecture-specific.
    #   error unknown architecture
    # endif
    
    // SUPPORT_NONPOINTER_ISA
    #endif
    
    };

