#!/bin/bash
cd /usr/lib/vmware/modules/source
tar xaf vmmon.tar
tar xaf vmnet.tar

echo "In vmnet-only/userif.c, around line 117, change"
echo "#if LINUX_VERSION_CODE >= KERNEL_VERSION(4, 6, 0)
    retval = get_user_pages(addr, 1, 1, 0, &page, NULL);
#else
    retval = get_user_pages(current, current->mm, addr,
                1, 1, 0, &page, NULL);
#endif"
echo "-----------------------------------------------------"
echo "TO"
echo "-----------------------------------------------------"
echo "#if LINUX_VERSION_CODE >= KERNEL_VERSION(4, 9, 0)
     retval = get_user_pages(addr, 1, 0, &page, NULL);
#else
#if LINUX_VERSION_CODE >= KERNEL_VERSION(4, 6, 0)
     retval = get_user_pages(addr, 1, 1, 0, &page, NULL);
#else
     retval = get_user_pages(current, current->mm, addr,
                 1, 1, 0, &page, NULL);
#endif
#endif"
emacs vmnet-only/userif.c

echo "------------------------------------------------------------------------------------"
echo "and in vmmon-only/linux/hostif.c, around line 1166, change"
echo "#if LINUX_VERSION_CODE >= KERNEL_VERSION(4, 6, 0)
   retval = get_user_pages((unsigned long)uvAddr, numPages, 0, 0, ppages, NULL);
#else
   retval = get_user_pages(current, current->mm, (unsigned long)uvAddr,
                           numPages, 0, 0, ppages, NULL);
#endif
-----------------------------------------------------
TO
-----------------------------------------------------
#if LINUX_VERSION_CODE >= KERNEL_VERSION(4, 9, 0)
   retval = get_user_pages((unsigned long)uvAddr, numPages, 0, ppages, NULL);
#else
#if LINUX_VERSION_CODE >= KERNEL_VERSION(4, 6, 0)
   retval = get_user_pages((unsigned long)uvAddr, numPages, 0, 0, ppages, NULL);
#else
   retval = get_user_pages(current, current->mm, (unsigned long)uvAddr,
                           numPages, 0, 0, ppages, NULL);
#endif
#endif"

emacs vmmon-only/linux/hostif.c

echo "Creating backup"
cp vmmon.tar vmmon-old.tar
cp vmnet.tar vmnet-old.tar

echo "Packing archives"
tar zcf vmmon.tar vmmon-only
tar zcf vmnet.tar vmnet-only

echo "Compiling modules"

vmware-modconfig --console --install-all
