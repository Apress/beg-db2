update db cfg using pckcachesz automatic immediate


update db cfg using locklist automatic immediate


update monitor switches using statement on lock on uow on


connect to sample
update monitor switches using statement on
create event monitor empofyear for statements write to file 'c:\eventmon'
set event monitor empofyear state=1


set event monitor empofyear state=0
terminate


update monitor switches using lock on


get snapshot for locks for application agentid 58


select agent_id, lock_object_type, tabname, lock_mode, lock_status
from table(snap_get_lock('',-1)) as locksnapshot


describe output select * from table(snap_get_lock('',-1)) as locksnapshot


select agent_id, lock_object_type, tabname, lock_mode, lock_status
from sysibmadm.snaplock


runstats on table fuzzy.nomination


runstats on table fuzzy.nomination
with distribution on columns (empno, reason)


runstats on table fuzzy.nomination
with distribution on columns (empno, reason)
and detailed indexes all


runstats on table fuzzy.nomination
with distribution on columns (empno, reason)
and detailed indexes all
allow read access


reorgchk current statistics on schema fuzzy


reorg table fuzzy.nomination


reorg table fuzzy.nomination index nom_empno inplace allow write access start


reorg indexes all for table nomination allow read access cleanup only